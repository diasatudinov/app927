//
//  Workout.swift
//  app927
//
//  Created by Dias Atudinov on 19.09.2024.
//

import Foundation

struct Workout: Identifiable, Hashable, Codable  {
    var id = UUID()
    var name: String
    var venue: String
    var tasks: String
    var dayOfWeek: String
    var startTime : Date
    var endTime: Date
    var category: String
}
