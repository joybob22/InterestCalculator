//
//  ListOfLoansView.swift
//  InterestCalculator
//
//  Created by Brayden Lemke on 1/11/22.
//

import SwiftUI

struct ListOfLoansView: View {
    var loans: [Loan]
    var body: some View {
        NavigationView {
            List {
                ForEach(loans, id: \.name) { loan in
                    LoanRowView(loan: loan)
                }
            }
            .navigationTitle("Loans")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button(action: {}) {
                    Image(systemName: "plus")
                }
                .padding()
            }
        }
    }
}

struct ListOfLoansView_Previews: PreviewProvider {
    static var testData: [Loan] = [
        Loan(amount: 23000, interestRate: 0.07, term: 24, name: "Car Payment"),
        Loan(amount: 450000, interestRate: 0.03, term: 360, name: "House Payment"),
        Loan(amount: 77000, interestRate: 0.12, term: 50, name: "Tesla Payment")
    ]
    
    static var previews: some View {
        ListOfLoansView(loans: testData)
    }
}
