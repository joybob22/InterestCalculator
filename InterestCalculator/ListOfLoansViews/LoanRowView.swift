//
//  LoanRowView.swift
//  InterestCalculator
//
//  Created by Brayden Lemke on 1/11/22.
//

import SwiftUI

struct LoanRowView: View {
    @Binding var loan: Loan
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(loan.name)
                Text("\(LoanController.currencyFormatter(number: loan.amount))")
                    .font(.caption)
                    .foregroundColor(Color.gray)
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
        LoanRowView(loan: .constant(LoanController.testData[0]))
            .previewLayout(.sizeThatFits)
    }
}
