//
//  WorkoutsView.swift
//  FitPrep
//
//  Created by Ryan Helmn on 18/02/2023.
//

import SwiftUI
import Combine
import CoreData

struct AddSheetView: View {
    @Environment(\.dismiss) var dismiss
    @State var test = ""

    var body: some View {
        NavigationView {
            Form {
                Section("Name") {
                    TextField("Enter a name for your workout", text: $test)
                }
                
                Section("Description") {
                    TextEditor(text: $test)
                }

                Button("Press to dismiss") {
                    dismiss()
                }
            }
                .navigationTitle("Add Workout")
        }
    }
}


struct WorkoutsView: View {
    @EnvironmentObject var settingsViewModel: SettingsViewModel
    @Environment(\.managedObjectContext) private var managedObjectContext

    @StateObject var viewModel: WorkoutsViewModel

    init(managedObjectContext: NSManagedObjectContext) {
        _viewModel = StateObject(wrappedValue: WorkoutsViewModel(managedObjectContext: managedObjectContext))
    }

    var body: some View {
        NavigationStack {
            List {
                Section {
                    if settingsViewModel.settings.showWorkoutReminder {
                        HStack {
                            Image(systemName: "exclamationmark.circle")
                            Text("You haven't worked out for 4 days now.")
                                .font(.callout)
                        }
                    }
                }
            }

                .navigationBarTitle(Text("Workouts"))
                .toolbar {
                ToolbarItem(placement: .navigationBarTrailing, content: {
                    Button("Add Workout") {
                        viewModel.showingAddSheet = true
                    }
                })
            }
                .sheet(isPresented: $viewModel.showingAddSheet) {
                AddSheetView()
            }
                .sheet(isPresented: $viewModel.showingEditSheet) {
                AddSheetView()
            }
        }
    }
}

struct WorkoutsView_Previews: PreviewProvider {
    static var previews: some View {
        let context = FitPrepApp().persistenceController.container.viewContext
        let settingsViewModel = SettingsViewModel()

        return WorkoutsView(managedObjectContext: context)
            .environmentObject(settingsViewModel)
    }
}
