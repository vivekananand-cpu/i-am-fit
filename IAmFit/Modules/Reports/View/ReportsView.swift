//
//  ReportsView.swift
//  IAmFit
//
//  Created by Vivek Thorat on 07/05/25.
//

import SwiftUI

struct ReportsView: View {
    @StateObject var viewModel = ReportsViewModel()
    var body: some View {
        VStack {
            Text("Todays Report")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            HStack(alignment: .center) {
                CaloriesBurnView(caloriesModel: viewModel.reportsPO.totalCaloriesBurned)
                ActiveTimeView(activeTime: viewModel.reportsPO.activeTime)
            }
            .padding()
            
            CaloriesBurnChartView(exerciseCalories: $viewModel.reportsPO.exerciseCalories)
        }
        .onAppear {
            viewModel.fetchReportsData()
        }
    }
}

struct CaloriesBurnView: View {
    var caloriesModel: CaloriesBurnPO
    var body: some View {
        VStack {
            Text(caloriesModel.title)
                .fontWeight(.semibold)
            Text(String(format: "%.2f", caloriesModel.calories))
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.red)
            
            Text(caloriesModel.unit)
        }
        .frame(width: 110)
        .padding()
        .background(
            Color.gray.opacity(0.1)
        )
        .cornerRadius(8)
    }
}

struct ActiveTimeView: View {
    var activeTime: ActiveTimePO
    var body: some View {
        VStack {
            Text(activeTime.title)
                .fontWeight(.semibold)
            Text(String(format: "%.2f", activeTime.value))
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.red)
            
            Text(activeTime.unit)
        }
        .frame(width: 110)
        .padding()
        .background(
            Color.gray.opacity(0.1)
        )
        .cornerRadius(8)
    }
}

#Preview {
    ReportsView()
}
