//
//  ExerciseCaloriesModel.swift
//  IAmFit
//
//  Created by Vivek Thorat on 07/05/25.
//

import Foundation

struct ExerciseCaloriesModel: Identifiable {
    let id: UUID = UUID()
    let calories: Int
    let exercise: String
}


struct CaloriesBurnPO {
    let title: String
    let calories: Int
    let unit: String
}

struct ActiveTimePO {
    let title: String
    let value: Int
    let unit: String
}
