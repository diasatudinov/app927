//
//  StatisticsViewModel.swift
//  app927
//
//  Created by Dias Atudinov on 23.09.2024.
//

import Foundation

class StatisticsViewModel: ObservableObject {
    @Published var statistics: [Stat] = [
    Stat(name: "Number of points", number: 0, icon: "gauge.with.needle.fill"),
    Stat(name: "Number of rebounds", number: 0, icon: "basketball.circle.fill"),
    Stat(name: "Number of gears", number: 0, icon: "figure.softball"),
    Stat(name: "Number of interceptions", number: 0, icon: "figure.volleyball")
    ]
    
    
    func addStat(_ stat: Stat) {
        statistics.append(stat)
    }
    
    func deleteStat(_ stat: Stat) {
        if let index = statistics.firstIndex(where: { $0.id == stat.id }) {
            statistics.remove(at: index)
        }
    }
    func editStat(_ stat: Stat, name: String, number: Int, icon: String) {
        if let index = statistics.firstIndex(where: { $0.id == stat.id }) {
            statistics[index].name = name
            statistics[index].number = number
            statistics[index].icon = icon
        }
    }
    
}
