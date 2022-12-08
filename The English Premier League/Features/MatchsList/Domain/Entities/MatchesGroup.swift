//
//  MatchesGroup.swift
//  The English Premier League
//
//  Created by Soliman Yousry on 08/12/2022.
//

import Foundation
struct MatchsGroup : Hashable, Codable, Identifiable {
    var id: Int
    var sectionTitle: String
    var matchDate: Date
    var matches: [Match]
}
