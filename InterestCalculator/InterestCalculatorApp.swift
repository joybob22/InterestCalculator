//
//  InterestCalculatorApp.swift
//  InterestCalculator
//
//  Created by Brayden Lemke on 1/6/22.
//

import SwiftUI

@main
struct InterestCalculatorApp: App {
    @StateObject private var loans = LoanController(loans: LoanController.testData)
    var body: some Scene {
        WindowGroup {
            ListOfLoansView(loanController: loans)
        }
    }
}
