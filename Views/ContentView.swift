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
    
    @State private var budgetExceeded = false
    
    @State private var deleteAlertShowing = false
        
    var body: some View {
        
        NavigationView {
            
            Form {
                
                Section(header: Text("Purchase Information")) {
                    
                    TextField("Description", text: $description)
                    
                    TextField("Cost ($)", text: $purchaseCost)
                    
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
                .alert(isPresented: $budgetExceeded) {
                    Alert(title: Text("Warning"), message: Text("You have exceeded your budget by $\(totalCost - setBudget, specifier: "%.2f")!"), dismissButton: .default(Text("Okay")) {
                    })
                }

                
                Section(header: Text("Budget Information")) {
                    
                    Text("Total Spent: $\(totalCost, specifier: "%.2f")")
                    
                    Text("Current Budget: $\(setBudget, specifier: "%.2f")")
                    
                    TextField("Change Budget ($)", text: $consideredBudget)
                    
                    Button(action: {
                        
                        setBudget = Double(consideredBudget) ?? 0
                        print("Current budget: \(setBudget)")
                        
                    }) {
                        
                        Text("Set Budget")
                        
                    }
                }
                
                Section {
                    NavigationLink("All Purchases", destination: PurchasesView(purchases: purchases))
                }
                
                Section {
                    Button(action: {
                        self.deleteAlertShowing = true
                    }) {
                        Text("Delete Purchases")
                            .foregroundColor(.red)
                    }
                    
                }
                .alert(isPresented: $deleteAlertShowing) {
                    Alert(title: Text("Delete Purchases?"), message: Text("This will wipe out every purchase you made and the cost."),
                          primaryButton: .default(Text("Continue")) {
                        DeletePurchases()
                    }, secondaryButton: .cancel())
                }
            }.navigationBarTitle("Budget", displayMode: .inline)
            
        }
    }
    func DeletePurchases() {
        
        purchases = []
        totalCost = 0
        budgetExceeded = false
        deleteAlertShowing = false
        
    }
    
    func addToPurchases() {
        
        totalCost += Double(purchaseCost) ?? 0
        
        let newPurchase = Purchase(description: description,
                                  cost: Double(purchaseCost) ?? 0,
                                  category: categories[selectedCategory])
        
        purchases.insert(newPurchase, at: 0)
        
        if totalCost > setBudget {
            budgetExceeded = true
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
