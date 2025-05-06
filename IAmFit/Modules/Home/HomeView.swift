//
//  HomeView.swift
//  IAmFit
//
//  Created by Vivek Thorat on 05/05/25.
//

import SwiftUI

struct HomeTabView: View {
    var body: some View {
        TabView {
            ExerciseListView()
                .tabItem {
                    Image(systemName: "figure")
                    Text("Exercise")
                }
            
            Text("Calories burn exercise Tab")
                .tabItem {
                    Image(systemName: "chart.bar")
                    Text("Reports")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Profile")
                }
        }
    }
}

#Preview {
    HomeTabView()
}
