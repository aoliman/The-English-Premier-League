//
//  CompetitionsMatchesRep.swift
//  The English Premier League
//
//  Created by Soliman Yousry on 08/12/2022.
//

import Foundation

public class CompetitionsMatchesRep : CompetitionsMatchesRepProtocol {
    func getFavMatches() -> Set<Int>? {
        return UserDefaultsManger.favMatches
    }
    
    func setFavMatches(ids: Set<Int>) {
        UserDefaultsManger.favMatches = ids
    }
    
    private let src: CompetitionsMatchesServiceDataSourceProtocol = HomeDIContainer.competitionsMatchesServiceDataSource()

    func getCompetitionsMatches() async -> [MatchModel] {
        do {
           return try await src.getAllCompetitionsMatches()?.matches ?? []
        } catch {
            return []
        }
        
    }

}

