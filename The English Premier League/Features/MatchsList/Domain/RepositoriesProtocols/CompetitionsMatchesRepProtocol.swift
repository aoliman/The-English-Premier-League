//
//  File.swift
//  The English Premier League
//
//  Created by Soliman Yousry on 08/12/2022.
//

import Foundation

protocol CompetitionsMatchesRepProtocol{
    func getCompetitionsMatches() async  ->  [MatchModel]
    func getFavMatches()  ->  Set<Int>?
    func setFavMatches(ids:Set<Int>) 
}


