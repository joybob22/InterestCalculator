//
//  LoanRowView.swift
//  InterestCalculator
//
//  Created by Brayden Lemke on 1/11/22.
//

import SwiftUI

struct LoanRowView: View {
    var loan: Loan
    var body: some View {
        HStack {
            VStack {
                Text(loan.name)
                Text("$\(String(format: "%.2f", loan.amount))")
                    .font(.caption)
                    .foregroundColor(Color.gray)
                    .padding(.leading, -30)
                    
            }
            Spacer()
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Image(systemName: "chevron.right")
            }
        }
        .padding()
    }
}

struct LoanRowView_Previews: PreviewProvider {
    static var previews: some View {
        LoanRowView(loan: Loan(amount: 23000, interestRate: 0.07, term: 24, name: "Car Payment"))
            .previewLayout(.sizeThatFits)
    }
}
