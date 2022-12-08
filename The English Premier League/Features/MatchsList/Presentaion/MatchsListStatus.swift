//
//  MatchsListStatus.swift
//  The English Premier League
//
//  Created by Soliman Yousry on 08/12/2022.
//

import Foundation
import SwiftUI

enum MatchsListStatus  {
    case Loading
    case showMatchesGroup([MatchsGroup])
    case ShowFavorite([MatchsGroup])
    case Failure(String)
}
