//
//  WorkoutsViewModel.swift
//  FitPrep
//
//  Created by Ryan Helmn on 02/03/2023.
//

import Foundation
import Combine
import CoreData

class WorkoutsViewModel: ObservableObject {
    private var managedObjectContext: NSManagedObjectContext

    @Published var showingAddSheet = false
    @Published var showingEditSheet = false

    init(managedObjectContext: NSManagedObjectContext) {
        self.managedObjectContext = managedObjectContext
    }

    func addWorkout(name: String, workoutDescription: String?, type: WorkoutType, sets: [Set]?, distance: Double) {
        let workout = Workout(context: managedObjectContext)
        workout.id = UUID()
        workout.name = name
        workout.workoutDescription = workoutDescription
        workout.workoutType = type

        if type == .weights {
            if let sets = sets {
                workout.sets = NSSet(array: sets)
            }
        } else {
            workout.distance = distance
        }

        saveContext()
    }

    func updateWorkout(workout: Workout, name: String, workoutDescription: String?, type: WorkoutType, sets: [Set]?, distance: Double) {
        workout.name = name
        workout.workoutDescription = workoutDescription
        workout.workoutType = type

        if type == .weights {
            if let sets = sets {
                workout.sets = NSSet(array: sets)
            }
        } else {
            workout.distance = distance
        }

        saveContext()
    }

    func deleteWorkout(workout: Workout) {
        managedObjectContext.delete(workout)
        saveContext()
    }

    func saveContext() {
        do {
            try managedObjectContext.save()
        } catch {
            print("Error saving managed object context: \(error)")
        }
    }
}
