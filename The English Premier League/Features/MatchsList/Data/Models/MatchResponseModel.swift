//
//  File.swift
//  The English Premier League
//
//  Created by Soliman Yousry on 08/12/2022.
//

import Foundation

struct MatchResponseModel: Codable {
    let count: Int?
    let competition: Competition?
    let matches: [MatchModel]
}

// MARK: - Competition
struct Competition: Codable {
    let id: Int?
    let area: Area?
    let name, code, plan: String?
    let lastUpdated: Date?
}

// MARK: - Area
struct Area:  Hashable, Codable, Identifiable {
    let id: Int?
    let name: String?
    let shortName: String?
    let crest: String?
    let tla: String?
}

// MARK: - Match
struct MatchModel: Codable {
    let id: Int?
    let season: Season?
    let utcDate: String?
    let status: String?
    let matchday: Int?
    let stage: Stage?
    let group: String?
    let lastUpdated: String?
    let odds: Odds?
    let score: Score?
    let homeTeam, awayTeam: Area?
    let referees: [Referee]?
}

// MARK: - Odds
struct Odds: Codable {
    let msg: String?
}


// MARK: - Referee
struct Referee: Codable {
    let id: Int?
    let name: String?
    let role: Role?
    let nationality: Nationality?
}

enum Nationality: String, Codable {
    case australia = "Australia"
    case england = "England"
}

enum Role: String, Codable {
    case referee = "REFEREE"
}

// MARK: - Score
struct Score: Codable {
    let winner: Winner?
    let duration: Duration?
    let fullTime, halfTime, extraTime, penalties: Time?
}

enum Duration: String, Codable {
    case regular = "REGULAR"
}


public struct Time: Codable {
    public let home: Int?
    public let away: Int?
}


enum Winner: String, Codable {
    case awayTeam = "AWAY_TEAM"
    case draw = "DRAW"
    case homeTeam = "HOME_TEAM"
}

// MARK: - Season
struct Season: Codable {
    let id: Int?
    let startDate, endDate: String?
    let currentMatchday: Int?
}

enum Stage: String, Codable {
    case regularSeason = "REGULAR_SEASON"
}

enum Status: String, Codable , Hashable{
    case finished = "FINISHED"
    case postponed = "POSTPONED"
    case scheduled = "SCHEDULED"
    case timed = "TIMED"
}
