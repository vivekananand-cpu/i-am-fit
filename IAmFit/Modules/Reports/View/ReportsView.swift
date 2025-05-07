//
//  ReportsView.swift
//  IAmFit
//
//  Created by Vivek Thorat on 07/05/25.
//

import SwiftUI

struct ReportsView: View {
    var body: some View {
        VStack {
            Text("Calories Burned")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            HStack(alignment: .center) {
                CaloriesBurnView(caloriesModel: CaloriesBurnPO(title: "Total", calories: 352, unit: "kcal"))
                ActiveTimeView(caloriesModel: ActiveTimePO(title: "Active Time", value: 34, unit: "min"))
            }
            .padding()
            
            CaloriesBurnChartView()
        }
        
    }
}

struct CaloriesBurnView: View {
    var caloriesModel: CaloriesBurnPO
    var body: some View {
        VStack {
            Text(caloriesModel.title)
                .fontWeight(.semibold)
            Text("\(caloriesModel.calories)")
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
    var caloriesModel: ActiveTimePO
    var body: some View {
        VStack {
            Text(caloriesModel.title)
                .fontWeight(.semibold)
            Text("\(caloriesModel.value)")
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

#Preview {
    ReportsView()
}
