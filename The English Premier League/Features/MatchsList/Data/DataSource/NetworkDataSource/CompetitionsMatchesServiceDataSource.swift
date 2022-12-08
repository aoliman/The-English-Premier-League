//
//  MatchesDataSource.swift
//  The English Premier League
//
//  Created by Soliman Yousry on 08/12/2022.
//

import Foundation
import Combine

protocol CompetitionsMatchesServiceDataSourceProtocol{
    func getAllCompetitionsMatches() async throws -> MatchResponseModel?
}


class CompetitionsMatchesServiceDataSource : CompetitionsMatchesServiceDataSourceProtocol {
    
    private let service = WebService<CompetitionsMatchesService>()
    
    public func getAllCompetitionsMatches() async throws -> MatchResponseModel? {
        do {
            let publisherResponse: AnyPublisher<MatchResponseModel, Error> =  WebService<CompetitionsMatchesService>().requestObject(path: .getAllCompetitionsMatches)
            let responnse = try await publisherResponse.async()
            return responnse
        } catch {
            throw(error)
        }
        
    }
    
}

