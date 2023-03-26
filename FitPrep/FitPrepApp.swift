//
//  FitPrepApp.swift
//  FitPrep
//
//  Created by Ryan Helmn on 18/02/2023.
//

import SwiftUI

@main
struct FitPrepApp: App {
    @AppStorage("enableDarkMode") var enableDarkMode = false
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeTabsView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .preferredColorScheme(enableDarkMode ? .dark : .light)
        }
    }
}
