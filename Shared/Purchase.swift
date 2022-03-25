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
    var price: Double
    var category: String
}
