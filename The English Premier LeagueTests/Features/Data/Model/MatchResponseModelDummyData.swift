//
//  MatchResponseModelDummyData.swift
//  The English Premier LeagueTests
//
//  Created by Soliman Yousry on 09/12/2022.
//

import Foundation
@testable import The_English_Premier_League

class MatchResponseModelDummyData {
    

    let odds = Odds(msg: "Activate Odds-Package in User-Panel to retrieve odds.")
    let fullTime = Time(home: 6, away: 2)
    
    lazy var score = Score(winner: .homeTeam, duration: .regular, fullTime: fullTime, halfTime: nil, extraTime: nil, penalties: nil)

    let season = Season(id: 1490, startDate: "2022-08-05", endDate: "2023-05-28", currentMatchday: 17)
    
    let homeTeam = Area(id: 2072, name: "Arsenal FC", shortName: "Arsenal", crest: "https://crests.football-data.org/57.png", tla: "ARS")
    
    let awayTeam = Area(id: 351,name: "Southampton FC",shortName: "Southampton",crest: "https://crests.football-data.org/340.png", tla: "SOU")
        
    
    lazy var matchModel = MatchModel(id: 1256, season: season, utcDate: "2022-08-06T14:00:00Z", status: "FINISHED", matchday: 1, stage: .regularSeason, group: nil, lastUpdated: "2022-12-09T08:20:18Z", odds: odds, score: score, homeTeam: homeTeam, awayTeam: awayTeam, referees: [])
    
    lazy var matchResponsModel :MatchResponseModel = MatchResponseModel(count: 1, competition: nil, matches: [matchModel,matchModel])
    
    public static var favItems :[Int] = [1256]
    

}
