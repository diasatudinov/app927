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
    
    func deleteStat(_ workout: Workout) {
        if let index = workouts.firstIndex(where: { $0.id == workout.id }) {
            workouts.remove(at: index)
        }
    }
    func editStat(_ workout: Workout, name: String, venue: String, tasks: String, dayOfWeek: String, startTime: Date, endTime: Date, category: String) {
        if let index = workouts.firstIndex(where: { $0.id == workout.id }) {
            workouts[index].name = name
            workouts[index].venue = venue
            workouts[index].tasks = tasks
            workouts[index].dayOfWeek = dayOfWeek
            workouts[index].startTime = startTime
            workouts[index].endTime = endTime
            workouts[index].category = category
        }
    }
    
}
