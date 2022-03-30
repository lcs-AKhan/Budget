//
//  PurchasesView.swift
//  Budget
//
//  Created by Abdul-CS on 2022-03-26.
//

import SwiftUI

struct PurchasesView: View {
    
    var purchases: [Purchase]
    @State private var selectedPurchaseVisibility: PurchaseVisibility = .all
    
    var body: some View {
        
        Form {
            Section {
                Picker("Category", selection: $selectedPurchaseVisibility) {
                    Text(PurchaseVisibility.all.rawValue)
                        .tag(PurchaseVisibility.all)
                    Text(PurchaseVisibility.grocery.rawValue)
                        .tag(PurchaseVisibility.grocery)
                    Text(PurchaseVisibility.luxury.rawValue)
                        .tag(PurchaseVisibility.luxury)
                    Text(PurchaseVisibility.charity.rawValue)
                        .tag(PurchaseVisibility.charity)
                    Text(PurchaseVisibility.other.rawValue)
                        .tag(PurchaseVisibility.other)
                }
            }
            Section {
                List(filter(purchases, by: selectedPurchaseVisibility)) { purchase in
                    Text("\(purchase.description) - $\(purchase.cost, specifier: "%.2f") - \(purchase.category)")
                }
            }
        }
    }
    func filter(_ listOfPurchases: [Purchase], by visibility: PurchaseVisibility) -> [Purchase] {
        
        if visibility == .all {
            return listOfPurchases
        } else {
            
            var filteredPurchases: [Purchase] = []
            
            for currentPurchase in listOfPurchases {
                
                if visibility == .grocery && currentPurchase.category == "Grocery" {
                    filteredPurchases.insert(currentPurchase, at: 0)
                } else if visibility == .luxury && currentPurchase.category == "Luxury" {
                    filteredPurchases.insert(currentPurchase, at: 0)
                } else if visibility == .charity && currentPurchase.category == "Charity" {
                    filteredPurchases.insert(currentPurchase, at: 0)
                } else if visibility == .other && currentPurchase.category == "Other" {
                    filteredPurchases.insert(currentPurchase, at: 0)
                }
                
            }
            return filteredPurchases
        }
    }
}

//struct PurchasesView_Previews: PreviewProvider {
//    static var previews: some View {
//        PurchasesView()
//    }
//}
