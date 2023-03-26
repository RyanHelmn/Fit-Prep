//
//  SettingsView.swift
//  FitPrep
//
//  Created by Ryan Helmn on 18/02/2023.
//

import SwiftUI
import Combine

enum WeightMeasurement: String, CaseIterable {
    case lbs, kg
}

enum DistanceMeasurement: String, CaseIterable {
    case m, km
}

struct SettingsView: View {
    @EnvironmentObject var viewModel: SettingsViewModel
    @State private var showEraseAllDataConfirmation = false
    
    var body: some View {
        NavigationView {
            Form {
                Section("General") {
                    Toggle(isOn: $viewModel.settings.enableNotifications) {
                        Text("Notifications")
                    }

                    Toggle(isOn: $viewModel.settings.showWorkoutReminder) {
                        Text("Workout Reminders")
                    }

                    Toggle(isOn: $viewModel.settings.enableDarkMode) {
                        Text("Dark Mode")
                    }
                }

                Section("Metrics") {
                    Picker("Weight Measurement", selection: $viewModel.settings.weightMeasurement) {
                        Text("Kilograms").tag(WeightMeasurement.kg)
                        Text("Pounds").tag(WeightMeasurement.lbs)
                    }

                    Picker("Distance Measurement", selection: $viewModel.settings.distanceMeasurement) {
                        Text("Miles").tag(DistanceMeasurement.m)
                        Text("Kilometers").tag(DistanceMeasurement.km)
                    }
                }

                Button(role: .destructive, action: {
                   showEraseAllDataConfirmation = true
                }, label: {
                    Text("Erase All Data")
                })
            }
            .navigationBarTitle(Text("Settings"))
            .confirmationDialog("", isPresented: $showEraseAllDataConfirmation) {
                Button(role: .destructive, action: {
                    viewModel.eraseAllData()
                }, label: {
                    Text("Erase All Data")
                })
                Button("Cancel", role: .cancel) { }
            } message: {
                Text("You cannot undo this action...")
            }
        }
    }
}



struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        let settingsViewModel = SettingsViewModel()

        return SettingsView()
            .environmentObject(settingsViewModel)
    }
}
