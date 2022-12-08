//
//  WebServiceError.swift
//  Networking
//
//  Created by Soliman Yousry on 13/02/2022.
//

import Foundation
import Moya

public enum WebServiceError: Error {
    case parsing
    case api(message: String, errorCode: Int)
    case moya(error: MoyaError)
    case unknown
}
