//
//  The_English_Premier_LeagueApp.swift
//  The English Premier League
//
//  Created by Soliman Yousry on 08/12/2022.
//

import SwiftUI

@main
struct The_English_Premier_LeagueApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MatchsListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
