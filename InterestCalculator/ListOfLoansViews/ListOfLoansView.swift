//
//  ListOfLoansView.swift
//  InterestCalculator
//
//  Created by Brayden Lemke on 1/11/22.
//

import SwiftUI

struct ListOfLoansView: View {
    @StateObject var loanController: LoanController
    @State var showDeleteAlert = false
    @State var itemIndexSetToBeDeleted: IndexSet?
    @State var itemToBeDeleted: Loan?
    @State var showingLoanCalculator = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(loanController.data, id: \.name) { loan in
                    LoanRowView(loan: loan)
                }
                .onDelete(perform: deleteRow)
            }
            .navigationTitle("Loans")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button(action: {
                    showingLoanCalculator.toggle()
//                    loanController.objectWillChange.send()
                }) {
                    Image(systemName: "plus")
                }
                .padding()
            }
        }
        .confirmationDialog("Are you sure you want to delete the loan?", isPresented: $showDeleteAlert, titleVisibility: .visible, presenting: itemIndexSetToBeDeleted) { offsets in
            Button("Delete", role: .destructive) {}
            Button("Cancel", role: .cancel) {
                if let loanIndex = offsets.first, let itemToBeDeleted = itemToBeDeleted {
                    withAnimation {
                        loanController.data.insert(itemToBeDeleted, at: loanIndex)
                    }
                }
            }
        }
        .fullScreenCover(isPresented: $showingLoanCalculator) {
            LoanCalculator(loanController: loanController)
        }
    }
    
    func deleteRow(at offsets: IndexSet) {
        itemIndexSetToBeDeleted = offsets
        showDeleteAlert = true
        if let loanIndex = offsets.first {
            itemToBeDeleted = loanController.data[loanIndex]
        }
        loanController.data.remove(atOffsets: offsets)
    }
}

struct ListOfLoansView_Previews: PreviewProvider {
    static var previews: some View {
        ListOfLoansView(loanController: LoanController(loans: LoanController.testData))
    }
}
