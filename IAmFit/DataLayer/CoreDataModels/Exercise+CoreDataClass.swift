//
//  Exercise+CoreDataClass.swift
//  IAmFit
//
//  Created by Vivek Thorat on 07/05/25.
//
//

import Foundation
import CoreData

@objc(Exercise)
public class Exercise: NSManagedObject {

    func mapValues(model: ExercisePO) {
        if self.id == nil {
            self.id = UUID().uuidString.lowercased()
        }
        self.name = model.type.title
        if self.duration == nil {
            self.duration = model.duration
        } else {
            self.duration += model.duration
        }
        if self.calories_burned == nil {
            self.calories_burned = model.caloriesBurned
        } else {
            self.calories_burned += model.caloriesBurned
        }
        self.created_at = Date()
    }
}
