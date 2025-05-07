//
//  CaloriesBurnChartView.swift
//  IAmFit
//
//  Created by Vivek Thorat on 07/05/25.
//

import SwiftUI
import Charts

struct CaloriesBurnChartView: View {
    @StateObject var viewModel = ReportsViewModel()
    var body: some View {
        VStack {
            Text("Chart")
                .font(.title)
                .fontWeight(.bold)
            Chart(viewModel.chartsData) { data in
                BarMark(
                    x: .value("exercise", data.exercise),
                    y: .value("Calories burned", data.calories)
                )
                
            }
            .foregroundStyle(.red)
        }
        .padding()
        
    }
}

#Preview {
    CaloriesBurnChartView()
}
