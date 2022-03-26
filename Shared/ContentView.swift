//
//  ContentView.swift
//  Shared
//
//  Created by Abdul-CS on 2022-03-25.
//

import SwiftUI

struct ContentView: View {
    
    @State var purchases: [Purchase] = []
    
    @State private var purchaseCost = ""
    
    @State private var description = ""
    
    var currentCategory: String {
        
        categories[selectedCategory]
        
    }
    
    @State private var totalCost: Double = 0
    
    @State private var selectedCategory = 0
    
    let categories = ["Grocery", "Luxury", "Charity", "Other"]
    
    @State private var consideredBudget = ""
    
    @State private var setBudget: Double = 0
        
    var body: some View {
        
        NavigationView {
            
            Form {
                
                Section(header: Text("Purchase Information")) {
                    
                    TextField("Description", text: $description)
                    
                    TextField("Cost", text: $purchaseCost)
                    
                    Picker("Select Category", selection: $selectedCategory) {
                        
                        ForEach(0 ..< categories.count, id: \.self) {
                            
                            Text(self.categories[$0])
                            
                        }
                        
                    } .pickerStyle(SegmentedPickerStyle())
                    
                    Button(action: {
                        
                        addToPurchases()
                        
                    }) {
                        
                        Text("Add Purchase")
                        
                    }
                }
                
                Section(header: Text("Budget Information")) {
                    
                    Text("Total Spent: \(totalCost)")
                    
                    Text("Current Budget: \(setBudget)")
                    
                    TextField("Change Budget", text: $consideredBudget)
                    
                    Button(action: {
                        
                        setBudget = Double(consideredBudget) ?? 0
                        print("Current budget: \(setBudget)")
                        
                    }) {
                        
                        Text("Set Budget")
                        
                    }
                }
                
            }.navigationBarTitle("Budget", displayMode: .inline)
            
        }
    }
    func addToPurchases() {
        
        totalCost += Double(purchaseCost) ?? 0
        
        let newPurchase = Purchase(description: description,
                                  cost: Double(purchaseCost) ?? 0,
                                  category: categories[selectedCategory])
        
        purchases.insert(newPurchase, at: 0)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
