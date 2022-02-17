//
//  ContentView.swift
//  InterestCalculator
//
//  Created by Brayden Lemke on 1/6/22.
//

import SwiftUI



struct LoanCalculator: View {
    
    private enum Field: Int, CaseIterable {
        case amount, interestRate, term
    }
    
    @Environment(\.presentationMode) var presentation
    @Environment(\.colorScheme) var colorScheme
    
    @State private var amount: Double? = nil
    @State private var interestRate: Double? = nil
    @State private var term: Int? = nil
    
    @State private var isPresented: Bool = false
    @State private var text: String = ""
    @State private var loan: Loan?
    
    @StateObject var loanController: LoanController
    
    @FocusState private var focusField: Field?
    
    @ObservedObject private var chartDataContainer = ChartDataContainer(chartData: [])
    
    var body: some View {
        NavigationView {
            ZStack {
                Form {
                    
                    Section {
                        TextField("Amount - Ex. 2000 for $2,000", value: $amount, formatter: NumberFormatter()).keyboardType(.decimalPad).focused($focusField, equals: .amount)
                        TextField("Interst Rate - Ex. 7 for 7%", value: $interestRate, formatter: NumberFormatter()).keyboardType(.decimalPad).focused($focusField, equals: .interestRate)
                        TextField("Term - Ex. 12 for 12 months", value: $term, formatter: NumberFormatter()).keyboardType(.decimalPad).focused($focusField, equals: .term)

                    }
                    Section {
                        Button("Calculate") {
                            
                            if let amount = amount, let interestRate = interestRate, let term = term {
                                loan = Loan(amount: amount, interestRate: interestRate / 100, term: term, name: "")
                                //print(loan?.payment)
                                
                                let principalAmount: CGFloat = CGFloat(amount)
                                var interestAmount: CGFloat = 0 //total of interest payments
                                if let loan = loan {
                                    for term in loan.amoritization {
                                        interestAmount += term.interestPayment
                                    }
                                }
                               
                                let wholeAmount: CGFloat = principalAmount + interestAmount

                                chartDataContainer.chartData = [
                                    ChartData(color: Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)), percent : (principalAmount / wholeAmount) * 100, title: "Principal payment"),
                                    ChartData(color: Color(#colorLiteral(red: 1, green: 0.1875322177, blue: 0.212697154, alpha: 1)), percent: (interestAmount / wholeAmount) * 100, title: "Interest Payment"),
                                    //ChartData(color: Color(#colorLiteral(red: 0.4508578777, green: 0.9882974029, blue: 0.8376303315, alpha: 1)), percent: 40, value: 0),
                                    //ChartData(color: Color(#colorLiteral(red: 0.476841867, green: 0.5048075914, blue: 1, alpha: 1)), percent: 35, value: 0)]
                                    ]
                                
                                chartDataContainer.calc()
                            }
                            print("Hello")
                        }

                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(20)

                    Section {
                        VStack {
                            Text("Payments")
                            Divider()
                            
                            PieChart(charDataObj: chartDataContainer)
                            /*Image(systemName: "dollarsign.circle")
                                .resizable()
                                .background(Color.gray)
                                .frame(width: 200, height: 200, alignment: .center)
                                .padding()
                            */
                        }
                    }

                    Section {
                        Button("Submit") {
                            //Form Validation
                            if let _ = amount, let _ = interestRate, let _ = term {
                                self.text = ""
                                withAnimation {
                                    self.isPresented = true
                                }
                            }
                        }

                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    
                }
                                
                
                if isPresented {
                    colorScheme == .dark ? Color.black.ignoresSafeArea().opacity(0.7) : Color.white.ignoresSafeArea().opacity(0.7)
                }
                
                
                alertTextField(title: "Type a name", isShown: $isPresented, text: $text, onDone: {
                    text in
                    
                    if let amount = amount, let interestRate = interestRate, let term = term {
                        LoanController.shared.data.append(Loan(amount: amount, interestRate: interestRate / 100, term: term, name: text))
                        LoanController.shared.objectWillChange.send()
                        presentation.wrappedValue.dismiss()
                        
                        print(LoanController.shared.data)
                    }
                })
            }
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        focusField = nil
                    }
                }
                ToolbarItem {
                    Button("Cancel") {
                        presentation.wrappedValue.dismiss()
                    }
                }
            }

            .navigationTitle("Loan Calculator")
        }
        
        
        }
    func calc(chartDataInput: [ChartData]) -> [ChartData] {
        var value : CGFloat = 0
        var chartData = chartDataInput
        
        for i in 0..<chartData.count {
            value += chartData[i].percent
            chartData[i].value = value
            
        }
        return chartData
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoanCalculator(loanController: LoanController(loans: LoanController.testData))
    }
}
