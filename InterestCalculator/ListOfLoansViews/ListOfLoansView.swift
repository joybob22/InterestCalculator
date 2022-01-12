//
//  ListOfLoansView.swift
//  InterestCalculator
//
//  Created by Brayden Lemke on 1/11/22.
//

import SwiftUI

struct ListOfLoansView: View {
    @State var loans: [Loan]
    @State var showDeleteAlert = false
    @State var itemIndexSetToBeDeleted: IndexSet?
    
    var body: some View {
        NavigationView {
            List {
                ForEach($loans, id: \.name) { loan in
                    LoanRowView(loan: loan)
                }
                .onDelete(perform: deleteRow)
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
        .confirmationDialog("Are you sure you want to delete the loan?", isPresented: $showDeleteAlert, titleVisibility: .visible, presenting: itemIndexSetToBeDeleted) { offsets in
            Button("Delete", role: .destructive) {
                withAnimation {
                    // TODO
                    // Make a cancel button where the loan gets added back into the array
                    
//                    loans.remove(atOffsets: offsets)
                }
            }
        }
    }
    
    func deleteRow(at offsets: IndexSet) {
        itemIndexSetToBeDeleted = offsets
        showDeleteAlert = true
        loans.remove(atOffsets: offsets)
    }
}

struct ListOfLoansView_Previews: PreviewProvider {
    static var previews: some View {
        ListOfLoansView(loans: LoanController.testData)
    }
}
