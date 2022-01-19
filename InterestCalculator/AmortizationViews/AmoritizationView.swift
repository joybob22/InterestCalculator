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
        ScrollView {
            LazyVStack(alignment: .center, spacing: 15, pinnedViews: [.sectionHeaders], content: {
                Section(header: ListHeader()) {
                    ForEach(amoritization, id: \.termNumber) { row in
                            AmoritizationRowView(rowData: row)
                            Divider()
                             .frame(height: 1)
                             .padding(.horizontal, 30)
                             .background(Color.gray)
                    }
                    
                }
            })
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ListHeader: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            colorScheme == .dark ? Color.black.ignoresSafeArea() : Color.white.ignoresSafeArea()
            VStack {
                Spacer().frame(height:50)
                HStack {
                    Group {
//                        Spacer()
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
//                    Spacer()
                }
            }
            .padding([.trailing,.leading])
        }.frame(height:90)
    }
}

struct AmoritizationView_Previews: PreviewProvider {
    static var previews: some View {
        AmoritizationView(amoritization: LoanController.testData[2].amoritization)
    }
}
