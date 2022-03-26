//
//  Purchase.swift
//  Budget
//
//  Created by Abdul-CS on 2022-03-25.
//

import Foundation

struct Purchase: Identifiable {
    let id = UUID()
    var description: String
    var cost: Double
    var category: String
}
