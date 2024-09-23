//
//  Stat.swift
//  app927
//
//  Created by Dias Atudinov on 23.09.2024.
//

import Foundation

struct Stat: Identifiable, Hashable, Codable {
    var id = UUID()
    var name: String
    var number: Int
    var icon: String
}
