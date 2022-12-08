//
//  MatchesService.swift
//  The English Premier League
//
//  Created by Soliman Yousry on 08/12/2022.
//

import Foundation
import Moya

enum CompetitionsMatchesService {
    case getAllCompetitionsMatches
}

extension CompetitionsMatchesService: TargetType {
 
    public var baseURL: URL {
        return URL(string: Strings.baseURL)!
    }
        
    var path: String {
       switch self {
       case .getAllCompetitionsMatches:
           return Strings.EndPoints.matches
       }
       
    }
    
    var method: Moya.Method {
        switch self {
        case .getAllCompetitionsMatches:
           return Moya.Method.get
        }
    }
    
    var task: Task {
        switch self {
        case .getAllCompetitionsMatches:
           return .requestPlain
        }
      
    }
        
    public var headers: [String: String]? {
        return [Strings.Headers.contentTypeKey: Strings.Headers.contentType,
                Strings.Headers.apiKey : Strings.Headers.apiToken]
    }
    
}
