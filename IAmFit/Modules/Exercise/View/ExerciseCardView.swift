//
//  ExerciseCardView.swift
//  IAmFit
//
//  Created by Vivek Thorat on 05/05/25.
//

import SwiftUI

struct ExerciseCardView: View {
    let exercise: ExercisePO?
    var body: some View {
        VStack {
            GIFImageView(name: exercise?.gifName ?? "")
                .frame(width: .infinity, height: 180)
            Text(exercise?.type.title ?? "Six pack challenge")
                .font(.title3)
                .padding(4)
                .foregroundStyle(.white)
                .background(
                    Color.red
                )
                .cornerRadius(6)
        }
        .cornerRadius(8)
        .shadow(radius: 6)

    }
}

#Preview {
    ExerciseCardView(exercise: nil)
}
