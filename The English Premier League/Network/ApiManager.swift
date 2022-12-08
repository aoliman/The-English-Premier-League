//
//  ApiManager.swift
//  Networking
//
//  Created by Soliman Yousry on 13/02/2022.
//

import Foundation
import Moya
import Alamofire

public struct ApiManager {
    public static var shared = ApiManager()
    private(set) var token: String?
    private(set) var timeout: Double = 20
    private(set) var headers: [HTTPHeader] = []
    private init(){
        // Single instance
    }
    public mutating func appendHeader(headerItem: (key: String, value: String)) {
        headers.append(HTTPHeader(name: headerItem.key, value: headerItem.value))
    }
    public mutating func setTimeout(timeout: Double) {
        self.timeout = timeout
    }
   public var session: Alamofire.Session {
        let configuration = URLSessionConfiguration.default
        configuration.headers = HTTPHeaders(headers)
        configuration.timeoutIntervalForRequest = timeout // as seconds, you can set your request timeout
        configuration.timeoutIntervalForResource = timeout // as seconds, you can set your resource timeout
        configuration.requestCachePolicy = .useProtocolCachePolicy
       return Alamofire.Session.default
    }
}
