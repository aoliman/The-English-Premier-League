//
//  File.swift
//  The English Premier LeagueTests
//
//  Created by Soliman Yousry on 09/12/2022.
//

import Foundation
import Moya
import Combine
import SwiftyJSON

@testable import The_English_Premier_League

class WebServiceMock<T: TargetType> : WebServiceProtocol {
    typealias Provider = MoyaProvider<T>
    private var provider: MoyaProvider<T>
    public init(provider: MoyaProvider<T> = MoyaProvider<T>(session: ApiManager.shared.session, plugins: [NetworkLoggerPlugin(configuration: NetworkLoggerPlugin.Configuration(logOptions: .verbose)), NetworkActivityPlugin(networkActivityClosure: { (_, _) in })])) {
        self.provider = provider
    }
    func requestJSON(path: Provider) -> AnyPublisher<JSON, Error>{
        let subject = PassthroughSubject<JSON, Error>()
        return subject.eraseToAnyPublisher()
    }
    func requestObject<K: Codable>(path: Provider) -> AnyPublisher<K, Error>{
        let subject = PassthroughSubject<K, Error>()
        subject.send(MatchResponseModelDummyData().matchResponsModel as! K)
        return subject.eraseToAnyPublisher()
    }
    
    
}
