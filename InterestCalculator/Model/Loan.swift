//
//  Loan.swift
//  InterestCalculator
//
//  Created by Brayden Lemke on 1/10/22.
//

import Foundation
import SwiftUI

struct Loan {
    var amount: Double
    var interestRate: Double
    //term is in months
    var term: Int
    var payment: Double {
        amount * (interestRate / 12 * pow((1 + interestRate / 12), Double(term))) / (pow((1 + interestRate / 12), Double(term)) - 1)
    }
    var amoritization: [AmoritizationRow] {
        var completedAmortization: [AmoritizationRow] = []
        let monthlyInterestRate = interestRate / 12
        var remainingLoanBalance = amount
        var principalMonthlyPayment = payment - (remainingLoanBalance * monthlyInterestRate)
        for index in 1...term {
            completedAmortization.append(AmoritizationRow(termNumber: index, payment: payment, interestPayment: remainingLoanBalance * monthlyInterestRate, balance: remainingLoanBalance - principalMonthlyPayment, principal: principalMonthlyPayment ))
            
            remainingLoanBalance -= principalMonthlyPayment
            principalMonthlyPayment =  payment - remainingLoanBalance * monthlyInterestRate
            
        }
        return completedAmortization
    }
    var name: String
}
