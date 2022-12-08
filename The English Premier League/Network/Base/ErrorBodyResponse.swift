//
//  ErrorBodyResponse.swift
//  Networking
//
//  Created by Soliman Yousry on 13/02/2022.
//

import Foundation

public struct ErrorBodyResponse: Codable {
    public let message: String?
    public let propertyKey: String?
    public let type: String?
}
