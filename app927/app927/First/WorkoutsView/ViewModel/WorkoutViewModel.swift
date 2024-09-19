//
//  WorkoutViewModel.swift
//  app927
//
//  Created by Dias Atudinov on 19.09.2024.
//

import Foundation

class WorkoutViewModel: ObservableObject {
    @Published var workouts: [Workout] = [Workout(name: "Strength training", venue: "Main hall", tasks: "Working on throws", dayOfWeek: "Sunday", startTime: Date(), endTime: Date(), category: "Tactical training")]
    
    
    func addWorkout(_ workout: Workout) {
        workouts.append(workout)
    }
    
}
