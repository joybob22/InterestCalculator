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
    
    var body: some View {
        NavigationView {
            VStack {
                Form {

                    Section {
                        TextField("Amount - Ex. 2000 for $2,000", value: $amount, formatter: NumberFormatter()).keyboardType(.decimalPad).focused($focusField, equals: .amount)
                        TextField("Interst Rate - Ex. 7 for 7%", value: $interestRate, formatter: NumberFormatter()).keyboardType(.decimalPad).focused($focusField, equals: .interestRate)
                        TextField("Term - Ex. 12 for 12 months", value: $term, formatter: NumberFormatter()).keyboardType(.decimalPad).focused($focusField, equals: .term)
                        
                    }
                    Section {
                        Button("Calculate") {
                            print("Hello")
                            if let amount = amount, let interestRate = interestRate, let term = term {
                            loan = Loan(amount: amount, interestRate: interestRate / 100, term: term, name: "")
                                //print(loan?.payment)
                            }
                                
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
                            Image(systemName: "dollarsign.circle")
                                .resizable()
                                .background(Color.gray)
                                .frame(width: 200, height: 200, alignment: .center)
                                .padding()
                            
                            
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
                
                if isPresented {
                    colorScheme == .dark ? Color.black.ignoresSafeArea().opacity(0.7) : Color.white.ignoresSafeArea().opacity(0.7)
                }
                    
                
                alertTextField(title: "Type a name", isShown: $isPresented, text: $text, onDone: {
                    text in
                    
                    if let amount = amount, let interestRate = interestRate, let term = term {
                        loanController.data.append(Loan(amount: amount, interestRate: interestRate, term: term, name: text))
                        
                        presentation.wrappedValue.dismiss()
                        
                        print(LoanController.testData)
                    }
                    
                    
                 }
                
                )
                
            }
        }
        
        
        }
        
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoanCalculator(loanController: LoanController(loans: LoanController.testData))
    }
}
