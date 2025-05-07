//
//  ExerciseViewModel.swift
//  IAmFit
//
//  Created by Vivek Thorat on 06/05/25.
//

import Foundation
import Combine

enum TimerMode {
    case exercise
    case rest
}

let exerciseDuration: Int = 40
let restDuration: Int = 20

class ExerciseViewModel: ObservableObject {
    @Published var timeRemaining: Int = exerciseDuration
    @Published var timerStarted: Bool = false
    
    @Published var exercise: ExercisePO
    @Published var timerMode: TimerMode = .exercise
    @Published var setNumber: Int = 0
    
    var anyCancellables: Set<AnyCancellable> = []
    var timer: Timer?
    
    init(exercise: ExercisePO) {
        self.exercise = exercise
    }
    
    func startTimer() {
        timer?.invalidate() // Cancel previous timer if any
        timerStarted = true
        setNumber += 1
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            } else {
                self.timer?.invalidate()
                timerStarted = false
                saveExercise()
                startRestTimer()
            }
        }
    }
    
    func startRestTimer() {
        timerMode = .rest
        timeRemaining = restDuration
        timer?.invalidate()
        timerStarted = true
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            } else {
                resetTimer()
            }
        }
    }
    
    func resetTimer() {
        timer?.invalidate()
        timeRemaining = exerciseDuration
        timerStarted = false
        timerMode = .exercise
    }
    
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
        timerStarted = false
    }
}


extension ExerciseViewModel {
    func saveExercise() {
        exercise.duration = Double(exerciseDuration)
        exercise.caloriesBurned = exercise.type.caloriesBurnedPerSecond
        CoreDataManager.shared.insertExercise(exercise: exercise)
            
    }

}
