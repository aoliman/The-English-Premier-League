//
//  WebServiceProtocol.swift
//  Networking
//
//  Created by Mahmoud Elsheikh on 13/02/2022.
//

import Foundation
import Moya
import Combine
import CombineMoya
import SwiftyJSON

protocol WebServiceProtocol {
    associatedtype Provider
    
    func requestJSON(path: Provider) -> AnyPublisher<JSON, Error>
    func requestObject<K: Codable>(path: Provider) -> AnyPublisher<K, Error>
}

fileprivate var cancellableBag = Set<AnyCancellable>()

public struct WebService<T: TargetType>: WebServiceProtocol {
    private var provider: MoyaProvider<T>

    public init(provider: MoyaProvider<T> = MoyaProvider<T>(session: ApiManager.shared.session, plugins: [NetworkLoggerPlugin(configuration: NetworkLoggerPlugin.Configuration(logOptions: .verbose)), NetworkActivityPlugin(networkActivityClosure: { (_, _) in })])) {
        self.provider = provider
    }
    
    public func requestJSON(path: T) ->  AnyPublisher<JSON, Error> {
        
        let subject = PassthroughSubject<JSON, Error>()
        request(path: path).sink { completion in
            switch completion {
            case .finished: break
            case .failure(let error):
                subject.send(JSON(rawValue: error) ?? "")
            }
        } receiveValue: { response in
            subject.send(JSON(response.data))
        }.store(in: &cancellableBag)

        return subject.eraseToAnyPublisher()
    }
    
    public func requestObject<K: Codable>(path: T) -> AnyPublisher<K, Error> {
        
        let subject = PassthroughSubject<K, Error>()
        request(path: path).map{$0}.sink { error in
            subject.send(completion: error)
        } receiveValue: { response in
            if let obj: K = try? self.mapResponse(response) {
                subject.send(obj)
            } else {
                debugPrint(WebServiceError.parsing)
                subject.send(completion: .failure(WebServiceError.parsing))
            }
        }.store(in: &cancellableBag)
        return subject.eraseToAnyPublisher()
    }
    
    private func mapResponse<K: Codable>(_ response: Response) throws -> K {
        guard let object = try? JSONDecoder().decode(K.self, from: response.data) else { throw WebServiceError.parsing }
        return object
    }
    
    private func request(path: T) -> AnyPublisher<Response, Error> {
        
        NotificationCenterWrapper.showLoading.notify()
        let subject = PassthroughSubject<Response, Error>()
        self.provider.requestPublisher(path)
            .map { $0 }
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    debugPrint(">>> finished. success!")
                    subject.send(completion: .finished)
                    
                case .failure(let error as Moya.MoyaError?):
                    debugPrint("moya underlying error \(error?.localizedDescription ?? "")")
                    debugPrint("moya underlying error code \(String(describing: (error)))")
                    if error != nil {
                        let moyaError = WebServiceError.moya(error: error! )
                        subject.send(completion: .failure(moyaError))
                    } else {
                        subject.send(completion: .failure(WebServiceError.unknown))
                    }
                }
                
            },receiveValue: { response in
                if 200..<300 ~= response.statusCode {
                    if let json = String(data: response.data, encoding: .utf8), let statusCode =  response.response?.statusCode {
                        debugPrint("RESOPNSE: \(statusCode) \n \(json) \n")
                    }
                    subject.send(response)
                    subject.send(completion: .finished)
                }
                else if response.statusCode == 500 {
                    debugPrint("Internal server error")
                    subject.send(completion: .failure(WebServiceError.unknown))
                }
                else {
                    let error: WebServiceError = self.error(from: response)
                    switch (error) {
                    case .api(message: _, errorCode: let code):
                        if code == 401 {
                            NotificationCenterWrapper.inValidToken.notify()
                        }
                    default:
                        debugPrint("Unknown error")
                    }
                    subject.send(completion: .failure(error))
                }
                
                debugPrint(">>> message", response.data)
            }).store(in: &cancellableBag)
        return subject.eraseToAnyPublisher()
    }
    
    private func error(from response: Response) -> WebServiceError {
        guard let body: ErrorBodyResponse = try? self.mapResponse(response) else { return WebServiceError.parsing }
        debugPrint(body.message)
        return WebServiceError.api(message: body.message ?? "",
                                   errorCode: response.statusCode)
    }
}
