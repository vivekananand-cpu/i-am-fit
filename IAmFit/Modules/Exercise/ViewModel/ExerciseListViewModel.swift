//
//  ExerciseListViewModel.swift
//  IAmFit
//
//  Created by Vivek Thorat on 05/05/25.
//

import Foundation

class ExerciseListViewModel: ObservableObject {
    @Published var exercises: [ExercisePO] = ExerciseType.allCases.map({ExercisePO(id: $0.rawValue, gifName: $0.gifName, type: $0)})
    
}
