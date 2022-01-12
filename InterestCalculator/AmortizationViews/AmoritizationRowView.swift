//
//  AmoritizationRowView.swift
//  InterestCalculator
//
//  Created by Brayden Lemke on 1/12/22.
//

import SwiftUI

struct AmoritizationRowView: View {
    var rowData: AmoritizationRow
    var body: some View {
        HStack {
            Text("\(rowData.termNumber))")
            Spacer()
            Text("\(LoanController.currencyFormatter(number: rowData.payment))")
            Spacer()
            Text("\(LoanController.currencyFormatter(number: rowData.principal))")
            Spacer()
            Text("\(LoanController.currencyFormatter(number: rowData.interestPayment))")
            Spacer()
            Text("\(LoanController.currencyFormatter(number: rowData.balance))")
        }
        .font(.footnote)
    }
}

struct AmoritizationRowView_Previews: PreviewProvider {
    static var previews: some View {
        AmoritizationRowView(rowData: LoanController.testData[0].amoritization[0])
            .previewLayout(.sizeThatFits)
    }
}
