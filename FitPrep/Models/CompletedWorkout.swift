//
//  CompletedWorkout.swift
//  FitPrep
//
//  Created by Ryan Helmn on 22/03/2023.
//

import Foundation
import CoreData

public class CompletedWorkout: NSManagedObject, Identifiable {
    @NSManaged public var id: UUID
    @NSManaged public var date: Date
    @NSManaged public var workout: Workout?
}
