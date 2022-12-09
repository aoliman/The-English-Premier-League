//
//  HomeDIContainerMock.swift
//  The English Premier LeagueTests
//
//  Created by Soliman Yousry on 09/12/2022.
//

import Foundation
import Factory
@testable import The_English_Premier_League

extension HomeDIContainer  {
    static let competitionsMatchesServiceDataSourceMock = Factory<CompetitionsMatchesServiceDataSourceMocks> (scope: .shared,factory: {CompetitionsMatchesServiceDataSourceMocks() })
    
    static func setUpRepoMocks(){
        competitionsMatchesServiceDataSource.register{CompetitionsMatchesServiceDataSourceMocks()}
    }
    
    static func setUpUseCaseMocks(){
        setUpRepoMocks()
        competitionsMatchesRep.register{CompetitionsMatchesRepMock()}
    }
    
    static func setUpViewModelMocks(){
        setUpUseCaseMocks()
        competitionsMatchesUseCase.register{CompetitionsMatchesUseCaseMock()}
    }
    
}



