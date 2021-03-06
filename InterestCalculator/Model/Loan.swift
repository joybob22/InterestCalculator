//
//  Loan.swift
//  InterestCalculator
//
//  Created by Brayden Lemke on 1/10/22.
//

import Foundation
import SwiftUI

class Loan: ObservableObject, Identifiable {
    var id: UUID = UUID()
    @Published var amount: Double
    @Published var interestRate: Double
    //term is in months
    @Published var term: Int
    @Published var name: String
    var addedPayment:Double = 0
    
    
    var payment: Double {
        amount * (interestRate / 12 * pow((1 + interestRate / 12), Double(term))) / (pow((1 + interestRate / 12), Double(term)) - 1)
    }
    var amoritization: [AmoritizationRow] {
        var completedAmortization: [AmoritizationRow] = []
        let monthlyInterestRate = interestRate / 12
        var remainingLoanBalance = amount
        var principalMonthlyPayment = payment + addedPayment - (remainingLoanBalance * monthlyInterestRate)
        for index in 1...term {
            if remainingLoanBalance <= 0 {
                
            } else if remainingLoanBalance < payment + addedPayment {
                completedAmortization.append(AmoritizationRow(termNumber: index, payment: remainingLoanBalance + remainingLoanBalance * monthlyInterestRate, interestPayment: remainingLoanBalance * monthlyInterestRate, balance: 0, principal: remainingLoanBalance ))
                remainingLoanBalance -= remainingLoanBalance
            } else {
                completedAmortization.append(AmoritizationRow(termNumber: index, payment: payment, interestPayment: remainingLoanBalance * monthlyInterestRate, balance: remainingLoanBalance - principalMonthlyPayment, principal: principalMonthlyPayment ))
                remainingLoanBalance -= principalMonthlyPayment
                
            }
            
            
            
            
            principalMonthlyPayment =  payment + addedPayment - remainingLoanBalance * monthlyInterestRate
            
        }
        return completedAmortization
    }
    
    
    init(amount: Double, interestRate: Double, term: Int, name: String) {
        self.amount = amount
        self.interestRate = interestRate
        self.term = term
        self.name = name
    }
    
    init(amount: Double, interestRate: Double, term: Int, name: String, addedPayment: Double) {
        self.amount = amount
        self.interestRate = interestRate
        self.term = term
        self.name = name
        self.addedPayment = addedPayment
    }
}
