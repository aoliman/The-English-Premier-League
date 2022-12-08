//
//  Strings.swift
//  The English Premier League
//
//  Created by Soliman Yousry on 08/12/2022.
//

import Foundation
struct Strings {
    
    public static let baseURL = "https://api.football-data.org/v4/"

    
    struct Headers {
        
        public static let apiToken = "0e9f3a845f6d4b66b6f4c7d7de24d3a3"
        public static let apiKey = "X-Auth-Token"
        
        public static let contentTypeKey = "Content-Type"
        public static let contentType = "application/json"
        
    }
    
    struct EndPoints {
        public static let matches = "competitions/2021/matches"
        public static let conntentType = "application/json"
    }
    
    
    struct SegmentedView {
        public static let all = "All"
        public static let favorite = "Favorite"
    }
    
    
}
