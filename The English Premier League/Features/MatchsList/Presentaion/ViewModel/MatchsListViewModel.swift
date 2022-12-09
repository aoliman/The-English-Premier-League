//
//  MatchsListViewModel.swift
//  The English Premier League
//
//  Created by Soliman Yousry on 08/12/2022.
//

import Foundation
import SwiftUI
import Combine


public class MatchsListViewModel: ObservableObject  {
    
    private let useCase : CompetitionsMatchesUseCaseProtocol = HomeDIContainer.competitionsMatchesUseCase()
    
    @Published var state: MatchsListStatus  = .Loading
    @Published var matchesGroup: [MatchsGroup] =  []
    @Published var isFavorite:Bool = false {
        didSet{
            getMatchsGroup()
        }
    }
    
    var matches : [Match] =  []
    var favoriteMatches : [Match] =  []
    var savedFavoriteIds: Set<Int> = []

    func getMatches()  {
        Task(){
            matches =  await useCase.getMatches()
            getMatchsGroup()
            savedFavoriteIds = useCase.getFavMatches()
        }
    }
    
    
    func getMatchsGroup() {
        var dic = [String: MatchsGroup]()
        let matches: [Match] = isFavorite ? favoriteMatches : matches
        for (index, match) in matches.enumerated() {
            let compareDate: String = match.compareDate
            if let _ = dic[compareDate] {
                dic[compareDate]?.matches.append(match)
            } else {
                dic[compareDate] = MatchsGroup(id: index,sectionTitle: compareDate, matchDate: DateHelper.date(from: compareDate,with: DatePattern.dd_MM_yyyy)!, matches: [match])
            }
        }
        
        DispatchQueue.main.async { [weak self]  in
            guard let self = self else {return}
            withAnimation() {
                self.matchesGroup = dic.map{$0.value}
                self.matchesGroup = self.matchesGroup.sorted(by: {
                    $0.matchDate.compare($1.matchDate) == .orderedAscending
                })
                self.state = self.isFavorite ? .ShowFavorite(self.matchesGroup): .showMatchesGroup(self.matchesGroup)
            }
        }
    }
    
    func toggleFav(item: Match) {
        if savedFavoriteIds.contains(item.id) {
            savedFavoriteIds.remove(item.id)
        } else {
            savedFavoriteIds.insert(item.id)
        }
        useCase.setFavMatches(ids: savedFavoriteIds)
        getFavoriteMatches()
        getMatchsGroup()
    }
    
    func getFavoriteMatches(){
        favoriteMatches = []
        for match in matches {
            if(savedFavoriteIds.contains(match.id)) {favoriteMatches.append(match)}
        }
    }
    
    func isFavorite (match: Match) -> Bool {
      return savedFavoriteIds.contains(match.id)
    }
    
    
}


