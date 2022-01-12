//
//  AmoritizationView.swift
//  InterestCalculator
//
//  Created by Brayden Lemke on 1/12/22.
//

import SwiftUI

struct AmoritizationView: View {
    var amoritization: [AmoritizationRow]
    
    @Environment(\.defaultMinListRowHeight) var minRowHeight
    
    var body: some View {
        LazyVStack(pinnedViews: [.sectionHeaders]) {
//            ScrollView {
                Section {
                    List {
                        ForEach(amoritization, id: \.termNumber) { row in
                            AmoritizationRowView(rowData: row)
//                                                            .frame(minHeight: minRowHeight)
                        }
                    }
                    .frame(minHeight: minRowHeight * 15)
                    .listStyle(PlainListStyle())
                } header: {
                    HStack {
                        Group {
                            Spacer()
                            Text("Term").bold()
                            Spacer()
                            Text("Pay.").bold()
                        }
                        Spacer()
                        Text("Princ.").bold()
                        Spacer()
                        Text("Interest").bold()
                        Spacer()
                        Text("Balance").bold()
                        Spacer()
                    }
                }
            }
//        }
    }
}

struct AmoritizationView_Previews: PreviewProvider {
    static var previews: some View {
        AmoritizationView(amoritization: LoanController.testData[0].amoritization)
    }
}
