//
//  WorkoutType.swift
//  FitPrep
//
//  Created by Ryan Helmn on 22/03/2023.
//

import Foundation

public enum WorkoutType: Int16 {
    case weights
    case distance
}

extension WorkoutType: Codable {}
