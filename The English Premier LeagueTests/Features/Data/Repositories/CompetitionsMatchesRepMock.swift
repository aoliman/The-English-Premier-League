//
//  CompetitionsMatchesRepMock.swift
//  The English Premier LeagueTests
//
//  Created by Soliman Yousry on 09/12/2022.
//

import Foundation
@testable import The_English_Premier_League


class CompetitionsMatchesRepMock:CompetitionsMatchesRepProtocol {
    private let competitionsMatchesSrc = HomeDIContainer.competitionsMatchesServiceDataSource()
    var isGetCompetitionsMatchesCalled = false
    var isSetFavMatchesCalled = false
    func getCompetitionsMatches() async -> [The_English_Premier_League.MatchModel] {
        isGetCompetitionsMatchesCalled = true
        do {
           return try await competitionsMatchesSrc.getAllCompetitionsMatches()?.matches ?? []
        } catch {
            return []
        }
    }
    
    func getFavMatches() -> Set<Int>? {
        return Set(MatchResponseModelDummyData.favItems)
    }
    
    func setFavMatches(ids: Set<Int>) {
        MatchResponseModelDummyData.favItems = Array(ids)
    }
    
    
}
