//
//  CompetitionsMatchesServiceDataSourceMocks.swift
//  The English Premier LeagueTests
//
//  Created by Soliman Yousry on 09/12/2022.
//

import Foundation
@testable import The_English_Premier_League

class CompetitionsMatchesServiceDataSourceMocks :CompetitionsMatchesServiceDataSourceProtocol {
    var isCalled = false
    func getAllCompetitionsMatches() async throws -> The_English_Premier_League.MatchResponseModel? {
        isCalled = true
        return MatchResponseModelDummyData().matchResponsModel
    }
}
