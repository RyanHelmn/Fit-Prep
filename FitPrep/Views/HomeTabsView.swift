//
//  HomeTabsView.swift
//  FitPrep
//
//  Created by Ryan Helmn on 18/02/2023.
//

import SwiftUI
import Combine

struct HomeTabsView: View {
    @Environment(\.managedObjectContext) private var managedObjectContext
    @StateObject var settingsViewModel = SettingsViewModel()
    
    var body: some View {
        TabView {
            WorkoutsView(managedObjectContext: managedObjectContext)
                .tabItem {
                Label("Workouts", systemImage: "dumbbell")
            }
                .environmentObject(settingsViewModel)

            MealsView()
                .tabItem {
                Label("Meals", systemImage: "carrot")
            }

            SettingsView()
                .tabItem {
                Label("Settings", systemImage: "gearshape.2")
            }
                .environmentObject(settingsViewModel)
        }
    }
}

struct HomeTabsView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabsView()
    }
}
