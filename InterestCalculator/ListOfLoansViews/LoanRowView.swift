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
        NavigationLink(destination: NewPayment(loan: loan, newLoan: loan)) {
            HStack {
                VStack(alignment: .leading) {
                    Text(loan.name)
                    Text("\(LoanController.currencyFormatter(number: loan.amount))")
                        .font(.caption)
                        .foregroundColor(Color.gray)
                }
                Spacer()
            }
            .padding()
        }
    }
}

struct LoanRowView_Previews: PreviewProvider {
    static var previews: some View {
        LoanRowView(loan: LoanController.testData[0])
            .previewLayout(.sizeThatFits)
    }
}
