//
//  Workout.swift
//  FitPrep
//
//  Created by Ryan Helmn on 22/03/2023.
//

import Foundation
import CoreData

public class Workout: NSManagedObject, Identifiable {
    @NSManaged public var id: UUID
    @NSManaged public var name: String
    @NSManaged public var workoutDescription: String?
    @NSManaged public var type: Int16 // Use Int16 for the CoreData store
    @NSManaged public var sets: NSSet?
    @NSManaged public var distance: Double
    @NSManaged public var completedWorkouts: NSSet?

    public var workoutType: WorkoutType {
        get { WorkoutType(rawValue: type) ?? .weights }
        set { type = newValue.rawValue }
    }
}
