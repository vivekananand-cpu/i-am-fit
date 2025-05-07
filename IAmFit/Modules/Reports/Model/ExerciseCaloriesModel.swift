//
//  ExerciseCaloriesModel.swift
//  IAmFit
//
//  Created by Vivek Thorat on 07/05/25.
//

import Foundation

struct ExerciseCaloriesModel: Identifiable {
    let id: UUID = UUID()
    let calories: Double
    let exercise: String
}


struct CaloriesBurnPO {
    let title: String
    let calories: Double
    let unit: String
    
    init(title: String, calories: Double, unit: String) {
        self.title = title
        self.calories = calories
        self.unit = unit
    }
    
    init(model: [Exercise]) {
        self.title = "Burned"
        self.unit = "cal"
        self.calories = model.map((\.calories_burned)).reduce(0, +)
    }
}

struct ActiveTimePO {
    let title: String
    let value: Double
    let unit: String
    
    init(title: String, value: Double, unit: String) {
        self.title = title
        self.value = value
        self.unit = unit
    }
    
    init(model: [Exercise]) {
        self.title = "Active Time"
        self.unit = "min"
        self.value = model.map((\.duration)).reduce(0, +) / 60
    }
}

struct ReportsPO {
    var exerciseCalories: [ExerciseCaloriesModel]
    let totalCaloriesBurned: CaloriesBurnPO
    let activeTime: ActiveTimePO
    
    init(model: [Exercise]) {
        self.exerciseCalories = model.compactMap({ exercise in
            ExerciseCaloriesModel(calories: exercise.calories_burned, exercise: exercise.name ?? "")
        })
        
        self.totalCaloriesBurned = CaloriesBurnPO(model: model)
        self.activeTime = ActiveTimePO(model: model)
        
    }
}
