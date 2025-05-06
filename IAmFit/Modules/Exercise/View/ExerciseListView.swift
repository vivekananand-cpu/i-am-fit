//
//  ExerciseListView.swift
//  IAmFit
//
//  Created by Vivek Thorat on 05/05/25.
//

import SwiftUI

struct ExerciseListView: View {
    @StateObject var viewModel: ExerciseListViewModel = .init()
    
    var body: some View {
        NavigationStack {
            List(viewModel.exercises) { exercise in
                NavigationLink(destination: Text(exercise.title)) {
                    ExerciseCardView(exercise: exercise)
                }
            }
            .navigationTitle(
                Text("Select an Exercise")
                    
            )
            
        }
        
    }
}

#Preview {
    ExerciseListView()
}
