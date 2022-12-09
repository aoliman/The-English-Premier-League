//
//  CompetitionsMatchesRepTest.swift
//  The English Premier LeagueTests
//
//  Created by Soliman Yousry on 09/12/2022.
//

import XCTest
@testable import The_English_Premier_League

final class CompetitionsMatchesRepTest: XCTestCase {

    var srcMock : CompetitionsMatchesServiceDataSourceProtocol?
    var repo : CompetitionsMatchesRepProtocol?
    override func setUp()  {
        super.setUp()
        HomeDIContainer.Registrations.reset()
        HomeDIContainer.Scope.reset()
        HomeDIContainer.setUpRepoMocks()
        srcMock = HomeDIContainer.competitionsMatchesServiceDataSource()
        repo = HomeDIContainer.competitionsMatchesRep()
        HomeDIContainer.setUpRepoMocks()
    }

    override func tearDown()  {
        super.tearDown()
        srcMock = nil
        repo =  nil
    }
    

    func testGetCompetitionsMatches_whenSucssesfullyGetCompetitionsMatches() async {
        let matchs =  await repo?.getCompetitionsMatches()
            XCTAssertEqual(matchs?.count, MatchResponseModelDummyData().matchResponsModel.matches.count,"Failed when GetCompetitions Matches")
    }

}
