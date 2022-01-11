//
//  LoanController.swift
//  InterestCalculator
//
//  Created by Brayden Lemke on 1/11/22.
//

import Foundation

struct LoanController {
    static func currencyFormatter(number: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: NSNumber(value: number))!
    }
}
