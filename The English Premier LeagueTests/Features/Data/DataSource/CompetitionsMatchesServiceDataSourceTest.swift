//
//  CompetitionsMatchesServiceDataSourceTest.swift
//  The English Premier LeagueTests
//
//  Created by Soliman Yousry on 09/12/2022.
//

import XCTest
@testable import The_English_Premier_League


final class CompetitionsMatchesServiceDataSourceTest: XCTestCase {
    var sut : CompetitionsMatchesServiceDataSourceMocks?
    override func setUp()  {
        super.setUp()
        sut = HomeDIContainer.competitionsMatchesServiceDataSourceMock()
    }

    override func tearDown()  {
        super.tearDown()
        sut = nil
    }
    
    func testGetAllCompetitionsMatches_whenGetCompetitionsMatches () async {
        do{
           let matchsModel = try await sut?.getAllCompetitionsMatches()
            XCTAssertEqual(matchsModel?.matches.count, MatchResponseModelDummyData().matchResponsModel.matches.count,"Failed when GetCompetitions Matches")
            XCTAssertEqual(sut?.isCalled,true,"Failed when GetCompetitions Matches")
        }catch{
            XCTAssertEqual(sut?.isCalled,false,"Failed when GetCompetitions Matches")
        }
    }
    
}
