//
//  ExercisePO.swift
//  IAmFit
//
//  Created by Vivek Thorat on 05/05/25.
//

import Foundation
import UIKit

struct ExercisePO: Identifiable {
    let id: Int
    var gifName: String
    let title: String
    
    func getImage() -> UIImage? {
        gifImage(named: gifName)
    }
}
