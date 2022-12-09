//
//  CompetitionsMatchesUseCaseTest.swift
//  The English Premier LeagueTests
//
//  Created by Soliman Yousry on 09/12/2022.
//

import XCTest
@testable import The_English_Premier_League


final class CompetitionsMatchesUseCaseTest: XCTestCase {

    var repoMock : CompetitionsMatchesRepProtocol?
    var matchUsecase : CompetitionsMatchesUseCaseProtocol?
    override func setUp()  {
        super.setUp()
        HomeDIContainer.Registrations.reset()
        HomeDIContainer.Scope.reset()
        HomeDIContainer.setUpUseCaseMocks()
        repoMock = HomeDIContainer.competitionsMatchesRep()
        matchUsecase = HomeDIContainer.competitionsMatchesUseCase()
    }

    override func tearDown()  {
        super.tearDown()
        repoMock = nil
        matchUsecase =  nil
    }
    

    func testGetCompetitionsMatches_whenSucssesfullyGetCompetitionsMatches() async {
        let matchs =   await matchUsecase?.getMatches()
            XCTAssertEqual(matchs?.count, MatchResponseModelDummyData().matchResponsModel.matches.count,"Failed when Get Matches")
    }

    func testGetFavMatches_whenSucssesfullyFavMatches()  {
        let favMatchs =  matchUsecase?.getFavMatches()
        XCTAssertEqual(favMatchs?.count,1,"Failed when Get Fav Matches")
    }
    
}
