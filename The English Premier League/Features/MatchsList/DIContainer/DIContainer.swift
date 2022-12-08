//
//  File.swift
//  The English Premier League
//
//  Created by Soliman Yousry on 08/12/2022.
//

import Foundation
import Factory

public class HomeDIContainer : SharedContainer {
    static let competitionsMatchesServiceDataSource = Factory<CompetitionsMatchesServiceDataSourceProtocol> (scope: .shared,factory: {CompetitionsMatchesServiceDataSource() })
    
    static let competitionsMatchesRep = Factory<CompetitionsMatchesRepProtocol> (scope: .shared,factory: {CompetitionsMatchesRep() })
    
    static let competitionsMatchesUseCase = Factory<CompetitionsMatchesUseCaseProtocol> (scope: .shared,factory: {CompetitionsMatchesUseCase() })
    
    static let matchsListViewModel = Factory<MatchsListViewModel> (scope: .shared,factory: {  MatchsListViewModel() })
    
    
    
    
    
    
}
