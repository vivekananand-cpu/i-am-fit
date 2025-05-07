//
//  CaloriesBurnChartView.swift
//  IAmFit
//
//  Created by Vivek Thorat on 07/05/25.
//

import SwiftUI
import Charts

struct CaloriesBurnChartView: View {
    @Binding var exerciseCalories: [ExerciseCaloriesModel]
    var body: some View {
        VStack {
            Text("Chart")
                .font(.title)
                .fontWeight(.bold)
            if exerciseCalories.isEmpty {
                Text("No records found")
            } else {
                Chart(exerciseCalories) { data in
                    BarMark(
                        x: .value("exercise", data.exercise),
                        y: .value("Calories burned", data.calories)
                    )
                    
                }
                .foregroundStyle(.red)
            }
        }
        .padding()
        
    }
}

#Preview {
    CaloriesBurnChartView(exerciseCalories: .constant([]))
}
