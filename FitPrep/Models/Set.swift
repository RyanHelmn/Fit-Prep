//
//  Set.swift
//  FitPrep
//
//  Created by Ryan Helmn on 22/03/2023.
//

import Foundation
import CoreData

public class Set: NSManagedObject, Identifiable {
    @NSManaged public var id: UUID
    @NSManaged public var targetWeight: Double
    @NSManaged public var targetReps: Int16
    @NSManaged public var workout: Workout?
}
