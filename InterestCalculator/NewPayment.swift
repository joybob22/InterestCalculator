//
//  NewPayment.swift
//  InterestCalculator
//
//  Created by Luis Madriz on 1/24/22.
//

import SwiftUI

struct NewPayment: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var newPayment: Double? = nil
    @State var loan: Loan
    @FocusState private var focusField: Bool
    @State var show = false
    @State var newLoan: Loan
    @State var newInterestPayment: Double = 0
    @State var newTerm = 0
    
    var oldInterestpayment: Double {
        var payments: Double = 0
        for term in loan.amoritization {
            payments += term.interestPayment
        }
        return payments
    }
    
    var oldTerm: Int {
        loan.amoritization.count
    }
    
    var body: some View {
            VStack {
                Form {
                    
                    Section {
                        Text("Name: \(loan.name)")
                        Text("Term: \(newLoan.amoritization.count)")
                        Text("Interst Rate: \(loan.interestRate)")
                        Text("Payment: \(newLoan.payment + newLoan.addedPayment)")
                        
                    }
                    
                    Section {
                        
                        TextField("Extra monthly payment:", value: $newPayment, formatter: NumberFormatter())
                            .focused($focusField)
                    }
                    
                    NavigationLink("See amortiztion Table", destination: AmoritizationView(amoritization: newLoan.amoritization))
                    
                    Section {
                        Text("New Interest payment: \(newInterestPayment)")
                        Text("New Term: \(newTerm)")
                        Text("Old Interst payment: \(oldInterestpayment)")
                        Text("Old Term \(oldTerm)")
                    }
                    Section {
                        Button("Save New Payment") {
                            if  newLoan.addedPayment > 0 {
                                print(loan.id)
                                LoanController.shared.updatedLoan(loan: newLoan, id: loan.id)
                                LoanController.shared.objectWillChange.send()
                                presentationMode.wrappedValue.dismiss()
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                        .background(Color.blue).foregroundColor(.white).cornerRadius(20)
                }.toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {
                            focusField = false
                            if let newPayment = newPayment {

                                let newLoan1 = Loan(amount: loan.amount, interestRate: loan.interestRate, term: loan.term, name: loan.name, addedPayment: newPayment + loan.addedPayment)

                                print(loan.amoritization)
                                print(newLoan1.amoritization)
                                newLoan = newLoan1
                                newTerm = newLoan.amoritization.count
                                var payments:Double = 0
                                for term in newLoan.amoritization {
                                    payments += term.interestPayment
                                }
                                newInterestPayment = payments
                            }
                            
                        }
                    }
                }
            }
            .navigationTitle("New Payment")
    }
}

struct NewPayment_Previews: PreviewProvider {
    static var previews: some View {
        NewPayment(loan: LoanController.testData[0], newLoan: LoanController.testData[0])
    }
}
