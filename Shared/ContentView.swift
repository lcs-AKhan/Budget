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
    @State private var categories = ["Grocery", "Luxury", "Charity", "Other"]
    
    @State private var totalSpent: Double = 0
    
    var body: some View {
        
        NavigationView {
            Form {
                Section(header: Text("Purchase Information")) {
                    Text("")
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
