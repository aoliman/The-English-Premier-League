//
//  MatchsListViewModelTest.swift
//  The English Premier LeagueTests
//
//  Created by Soliman Yousry on 09/12/2022.
//

import XCTest
@testable import The_English_Premier_League

final class MatchsListViewModelTest: XCTestCase {

    var viewModel : MatchsListViewModel?
    var useCaseMock:CompetitionsMatchesUseCaseProtocol?
    override func setUp()  {
        super.setUp()
        HomeDIContainer.Registrations.reset()
        HomeDIContainer.Scope.reset()
        HomeDIContainer.setUpViewModelMocks()
        useCaseMock = HomeDIContainer.competitionsMatchesUseCase()
        viewModel = HomeDIContainer.matchsListViewModel()
    }

    override func tearDown()  {
        super.tearDown()
        useCaseMock = nil
    }
    
    func getMatch() async {
        viewModel?.matches =  await useCaseMock?.getMatches() ?? []
        viewModel?.getMatchsGroup()
        viewModel?.savedFavoriteIds = useCaseMock?.getFavMatches() ?? []
    }

    func testGetMatches_whenSucssesfullyGetMatches()  async {
        await getMatch()
        XCTAssertEqual(viewModel?.matches.count,2,"Failed when Get Matches")
    }
    
    func testGetMatchesGroup_whenSucssesfullyGetMatches()  async {
        await getMatch()
        sleep(2)
        XCTAssertEqual(viewModel?.matchesGroup.count,1,"Failed when Get Matches Group")
    }
    
  
    
    func testToggleFav_whenSucssesfullySaveFavMatche()  async {
        await getMatch()
        viewModel?.toggleFav(item: Match.toMatch(matchModel: MatchResponseModelDummyData().matchModel))
        sleep(2)
        XCTAssertEqual(viewModel?.matchesGroup.count,1,"Failed when Get Fav Matches Group")
        
    }
}
