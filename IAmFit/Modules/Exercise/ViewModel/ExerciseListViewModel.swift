//
//  ExerciseListViewModel.swift
//  IAmFit
//
//  Created by Vivek Thorat on 05/05/25.
//

import Foundation

class ExerciseListViewModel: ObservableObject {
    @Published var exercises: [ExercisePO] = [ExercisePO(id: 1, gifName: "push_ups", title: "Pushups Challenge"),
                                              ExercisePO(id: 2, gifName: "core_bycle", title: "Six Pack Challenge"),
                                              ExercisePO(id: 3, gifName: "jumping_jacks", title: "Jumping Jacks Challenge"),
                                              ExercisePO(id: 4, gifName: "sqates", title: "Squats Challenge"),
                                              ExercisePO(id: 5, gifName: "lunges", title: "Lunges Challenge")]
}
