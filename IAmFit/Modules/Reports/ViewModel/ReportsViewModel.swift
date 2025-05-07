//
//  ReportsViewModel.swift
//  IAmFit
//
//  Created by Vivek Thorat on 07/05/25.
//

import Foundation

class ReportsViewModel: ObservableObject {
    var chartsData: [ExerciseCaloriesModel] = [ExerciseCaloriesModel(calories: 34, exercise: "Six pack"),
                                               ExerciseCaloriesModel(calories: 65, exercise: "Pushups"),
                                               ExerciseCaloriesModel(calories: 34, exercise: "Crunches"),
                                               ExerciseCaloriesModel(calories: 114, exercise: "Lunges")
    ]
}
