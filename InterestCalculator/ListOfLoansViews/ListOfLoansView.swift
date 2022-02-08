//
//  ListOfLoansView.swift
//  InterestCalculator
//
//  Created by Brayden Lemke on 1/11/22.
//

import SwiftUI

struct ListOfLoansView: View {
    @State var showDeleteAlert = false
    @State var itemIndexSetToBeDeleted: IndexSet?
    @State var itemToBeDeleted: Loan?
    @State var showingLoanCalculator = false
    @ObservedObject var shared = LoanController.shared
    
    var body: some View {
        NavigationView {
            List {
                ForEach(shared.data) { loan in
                    LoanRowView(loan: loan)
                }
                .onDelete(perform: deleteRow)
            }
            .navigationTitle("Loans")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button(action: {
                    showingLoanCalculator.toggle()
//                    LoanController.shared.objectWillChange.send()
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
                        LoanController.shared.data.insert(itemToBeDeleted, at: loanIndex)
                    }
                }
            }
        }
        .fullScreenCover(isPresented: $showingLoanCalculator) {
            LoanCalculator(loanController: LoanController.shared)
        }
    }
    
    func deleteRow(at offsets: IndexSet) {
        itemIndexSetToBeDeleted = offsets
        showDeleteAlert = true
        if let loanIndex = offsets.first {
            itemToBeDeleted = LoanController.shared.data[loanIndex]
        }
        LoanController.shared.data.remove(atOffsets: offsets)
    }
}

struct ListOfLoansView_Previews: PreviewProvider {
    static var previews: some View {
        ListOfLoansView()
    }
}
