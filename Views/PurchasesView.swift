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
                List(purchases) { purchase in
                    Text("\(purchase.description) - $\(purchase.cost, specifier: "%.2f") - \(purchase.category)")
                }
            }
        
    }
}

//struct PurchasesView_Previews: PreviewProvider {
//    static var previews: some View {
//        PurchasesView()
//    }
//}
