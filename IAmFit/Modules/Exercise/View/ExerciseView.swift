//
//  ExerciseView.swift
//  IAmFit
//
//  Created by Vivek Thorat on 06/05/25.
//

import SwiftUI

struct ExerciseView: View {
    @ObservedObject var viewModel: ExerciseViewModel
   
    var body: some View {
        VStack {
            switch viewModel.timerMode {
            case .exercise:
                if viewModel.timerStarted {
                    GIFImageView(name: viewModel.exercise.gifName)
                        .frame(height: 250)
                }
                
            case .rest:
                Text("Take rest...")
                    .font(.largeTitle)
            }
            
            Spacer()
            
            VStack {
                Text("\(viewModel.timeRemaining)")
                    .font(.system(size: 60, weight: .bold))
                Button {
                    buttonHandlerStart()
                } label: {
                    let text = viewModel.timerStarted ? "Stop" : "Start"
                    
                    if viewModel.timerStarted == false {
                        Text(text)
                            .font(.title2)
                            .foregroundStyle(.white)
                            .padding()
                            .background(
                                Color.green
                            )
                            .cornerRadius(10)
                    }
                }
            }
            Spacer()

        }
        .navigationTitle(viewModel.exercise.type.title)
    }
}

extension ExerciseView {
    func buttonHandlerStart() {
        viewModel.startTimer()
    }
}

#Preview {
    ExerciseView(viewModel: ExerciseViewModel(exercise: .init(id: 1, gifName: "lunges", type: .lunges)))
}
