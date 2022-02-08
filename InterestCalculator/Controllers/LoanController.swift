//
//  LoanController.swift
//  InterestCalculator
//
//  Created by Brayden Lemke on 1/11/22.
//

import Foundation

class LoanController: ObservableObject {
    static var testData: [Loan] = [
        Loan(amount: 23000, interestRate: 0.07, term: 24, name: "Car Payment"),
        Loan(amount: 450000, interestRate: 0.03, term: 360, name: "House Payment"),
        Loan(amount: 120000, interestRate: 0.12, term: 60, name: "Tesla Payment")
    ]
    
    static var shared = LoanController(loans: testData)
    
    @Published var data: [Loan] {
        didSet {
            print(data.count)
        }
    }
    
    init(loans: [Loan]) {
        data = loans
    }
    
    func updatedLoan(loan: Loan, id: UUID) {
        for (i, aLoan) in data.enumerated() {
            if aLoan.id == id {
                data[i].addedPayment = loan.addedPayment
                print("changed: \(loan.addedPayment)")
            }
        }
    }
    
    static func currencyFormatter(number: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: NSNumber(value: number))!
    }
    
    static func bigNumberFormatter(number: Double) -> String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 0
        let newNum = number / 1000
        return formatter.string(from: NSNumber(value: newNum))!
    }
}
