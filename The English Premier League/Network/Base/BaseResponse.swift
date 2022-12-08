//
//  BaseResponse.swift
//  Networking
//
//  Created by Soliman Yousry on 13/02/2022.
//

import Foundation


public struct BaseResponse<T: Codable>: Codable{
    public let data: T?
    public let errors: [ErrorBodyResponse]?
    public let message: String?
}
