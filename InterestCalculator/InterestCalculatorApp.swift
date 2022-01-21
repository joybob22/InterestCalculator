//
//  InterestCalculatorApp.swift
//  InterestCalculator
//
//  Created by Brayden Lemke on 1/6/22.
//

import SwiftUI

@main
struct InterestCalculatorApp: App {
    @State private var loans = LoanController.data
    
    var body: some Scene {
        WindowGroup {
            ListOfLoansView(loans: $loans)
        }
    }
}
