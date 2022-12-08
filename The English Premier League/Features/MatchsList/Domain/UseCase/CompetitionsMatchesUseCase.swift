//
//  UseCase.swift
//  The English Premier League
//
//  Created by Soliman Yousry on 08/12/2022.
//

import Foundation

protocol CompetitionsMatchesUseCaseProtocol {
    func getMatches() async ->  [Match]
    func getFavMatches()  ->  Set<Int>
    func setFavMatches(ids:Set<Int>)
}

class CompetitionsMatchesUseCase : CompetitionsMatchesUseCaseProtocol {

    private let repo: CompetitionsMatchesRepProtocol = HomeDIContainer.competitionsMatchesRep()
    
    func getMatches() async -> [Match] {
        let matchesModel =  await  repo.getCompetitionsMatches()
        let matches = matchesModel.map{Match.toMatch(matchModel: $0)}
        return matches
    }
    
    func getFavMatches() -> Set<Int> {
        repo.getFavMatches() ?? []
    }
    
    func setFavMatches(ids: Set<Int>) {
        repo.setFavMatches(ids: ids)
    }
    
}
