//
//  LoanController.swift
//  InterestCalculator
//
//  Created by Brayden Lemke on 1/11/22.
//

import Foundation

struct LoanController {
    static var testData: [Loan] = [
        Loan(amount: 23000, interestRate: 0.07, term: 24, name: "Car Payment"),
        Loan(amount: 450000, interestRate: 0.03, term: 360, name: "House Payment"),
        Loan(amount: 77000, interestRate: 0.12, term: 50, name: "Tesla Payment")
    ]
    
    static func currencyFormatter(number: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: NSNumber(value: number))!
    }
}
