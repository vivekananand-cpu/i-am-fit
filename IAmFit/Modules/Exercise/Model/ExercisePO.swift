//
//  ExercisePO.swift
//  IAmFit
//
//  Created by Vivek Thorat on 05/05/25.
//

import Foundation
import UIKit

enum ExerciseType: Int, CaseIterable {
    case pushUp = 1
    case bycycleKicking
    case jumpingJack
    case squats
    case lunges
    
    var title: String {
        switch self {
        case .pushUp:
            return "Push Up"
        case .bycycleKicking:
            return "Bycycle Kicking"
        case .jumpingJack:
            return "Jumping Jack"
        case .squats:
            return "Squats"
        case .lunges:
            return "Lunges"
        }
    }
    
    var gifName: String {
        switch self {
        case .pushUp:
            return "push_ups"
        case .bycycleKicking:
            return "core_bycle"
        case .jumpingJack:
            return "jumping_jacks"
        case .squats:
            return "sqates"
        case .lunges:
            return "lunges"
        }
    }
    
    var caloriesBurnedPerSecond: Double {
        switch self {
        case .pushUp:
            return 0.14
        case .bycycleKicking:
            return 0.18
        case .jumpingJack:
            return 0.22
        case .squats:
            return 0.20
        case .lunges:
            return 0.19
        }
    }
}

struct ExercisePO: Identifiable {
    let id: Int
    var gifName: String
    let type: ExerciseType
    var duration: Double = 0.0
    var caloriesBurned: Double = 0.0
}
