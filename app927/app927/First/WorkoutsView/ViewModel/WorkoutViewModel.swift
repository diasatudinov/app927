//
//  WorkoutViewModel.swift
//  app927
//
//  Created by Dias Atudinov on 19.09.2024.
//

import Foundation

class WorkoutViewModel: ObservableObject {
    @Published var workouts: [Workout] = [Workout(name: "Strength training", venue: "Main hall", tasks: "Working on throws", dayOfWeek: "Sunday", startTime: Date(), endTime: Date(), category: "Tactical training")]
    {
        didSet {
            saveWorkouts()
        }
    }
    
    private let workoutsFileName = "workouts.json"

    init() {
        loadWorkouts()
    }
    
    
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
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    private func workoutsFilePath() -> URL {
        return getDocumentsDirectory().appendingPathComponent(workoutsFileName)
    }
    
   
    
    private func saveWorkouts() {
        DispatchQueue.global().async {
            let encoder = JSONEncoder()
            do {
                let data = try encoder.encode(self.workouts)
                try data.write(to: self.workoutsFilePath())
            } catch {
                print("Failed to save players: \(error.localizedDescription)")
            }
        }
    }
    
    
    private func loadWorkouts() {
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: workoutsFilePath())
            workouts = try decoder.decode([Workout].self, from: data)
        } catch {
            print("Failed to load players: \(error.localizedDescription)")
        }
    }
    
}
