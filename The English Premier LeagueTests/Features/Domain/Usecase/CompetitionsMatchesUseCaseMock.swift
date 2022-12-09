//
//  CompetitionsMatchesUseCaseMock.swift
//  The English Premier LeagueTests
//
//  Created by Soliman Yousry on 09/12/2022.
//

import Foundation
@testable import The_English_Premier_League

class CompetitionsMatchesUseCaseMock : CompetitionsMatchesUseCaseProtocol {
    
    private let repo: CompetitionsMatchesRepProtocol = HomeDIContainer.competitionsMatchesRep()
    
    var isSetFavMatchesCalled = false
    
    func getMatches() async -> [Match] {
        let matchesModel =  await  repo.getCompetitionsMatches()
        let matches = matchesModel.map{Match.toMatch(matchModel: $0)}
        return matches
    }
    
    func getFavMatches() -> Set<Int> {
        return repo.getFavMatches() ?? []
    }
    
    func setFavMatches(ids: Set<Int>) {
        isSetFavMatchesCalled = true
    }
    
}
