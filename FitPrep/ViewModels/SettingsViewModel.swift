//
//  SettingsViewModel.swift
//  FitPrep
//
//  Created by Ryan Helmn on 02/03/2023.
//

import SwiftUI
import Combine

class SettingsViewModel: ObservableObject {
    @Published var settings: SettingsModel
        
    init() {
        let initialSettings = SettingsModel()
        self.settings = initialSettings
    }
    
    func eraseAllData() {
        settings.enableNotifications = false
        settings.enableDarkMode = false
        settings.showWorkoutReminder = false
        settings.weightMeasurement = .kg
        settings.distanceMeasurement = .m
        
        objectWillChange.send()
    }
    
    func observeSettingsModel() -> AnyPublisher<SettingsModel, Never> {
        settings.objectWillChange
            .map { self.settings }
            .eraseToAnyPublisher()
    }
}


