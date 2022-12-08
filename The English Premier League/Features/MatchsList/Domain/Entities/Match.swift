//
//  Match.swift
//  The English Premier League
//
//  Created by Soliman Yousry on 08/12/2022.
//

import Foundation
public struct Match : Hashable, Codable, Identifiable {
    public let id: Int
    let homeTeam:Area?
    let awayTeam:Area?
    let time:String
    let status:Status
    let score:String?
    let compareDate: String
    var isFavorite: Bool? = false
    
    
    static func toMatch(matchModel:MatchModel)->Match {
        let time = matchModel.status! == Status.finished.rawValue ?  getDate(date: matchModel.utcDate!) : getMatchTime(date: matchModel.utcDate!) 
        
        return Match(id: matchModel.id ?? 0, homeTeam: matchModel.homeTeam, awayTeam: matchModel.awayTeam, time:time ?? "", status: Status(rawValue: matchModel.status!) ?? Status.finished , score: getScore(score: matchModel.score), compareDate: getDate(date: matchModel.utcDate!) ?? "")
    }

    static func getScore(score: Score?) -> String? {
        if let score = score , score.winner != nil  , let homeTeamScore = score.fullTime?.home , let awayTeamScore = score.fullTime?.away {
            return "\(homeTeamScore)  -  \(awayTeamScore)"
        }
        return nil
    }
    
    static func getDate(date: String) -> String?{
        return DateHelper().formatToStr(str: date, format: .dateFormat, toFormat: .dd_MM_yyyy)
    }
    
    static func getMatchTime(date: String) -> String?{
        return DateHelper().formatToStr(str: date, format: .dateFormat, toFormat: .time)
    }
    
}


