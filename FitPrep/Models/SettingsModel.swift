//
//  SettingsModel.swift
//  FitPrep
//
//  Created by Ryan Helmn on 27/02/2023.
//

import Foundation
import SwiftUI

class SettingsModel: ObservableObject {
    @AppStorage("enableNotifications") var enableNotifications = false
    @AppStorage("enableDarkMode") var enableDarkMode = false
    @AppStorage("showWorkoutReminder") var showWorkoutReminder = false
    @AppStorage("weightMeasurement") var weightMeasurement: WeightMeasurement = .kg
    @AppStorage("distanceMeasurement") var distanceMeasurement: DistanceMeasurement = .m

    func eraseAllData() {
        enableNotifications = false
        enableDarkMode = false
        showWorkoutReminder = false
        weightMeasurement = .kg
        distanceMeasurement = .m
    }
}

