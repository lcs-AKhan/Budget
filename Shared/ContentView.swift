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
        switch selectedCategory {
        case 0:
            return "Grocery"
        case 1:
            return "Luxury"
        case 2:
            return "Charity"
        default:
            return "Other"
        }
    }
    @State private var selectedCategory = 0
    
    let categories = ["Grocery", "Luxury", "Charity", "Other"]
    
    @State private var totalSpent: Double = 0
    
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
                }
            }.navigationBarTitle("Budget", displayMode: .inline)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
