//
//  ContentView.swift
//  InterestCalculator
//
//  Created by Brayden Lemke on 1/6/22.
//

import SwiftUI



struct ContentView: View {
    
    @State private var amount: Double? = nil
    @State private var interestRate: Double? = nil
    @State private var term: Int? = nil
    
    @State private var isPresented: Bool = false
    @State private var text: String = ""
    @State private var loan: Loan?
    
    var body: some View {
        NavigationView {
            ZStack {
                Form {

                    Section {
                        TextField("Amount", value: $amount, formatter: NumberFormatter())
                        TextField("Interst Rate", value: $interestRate, formatter: NumberFormatter())
                        TextField("Term", value: $term, formatter: NumberFormatter())
                        
                    }
                    Section {
                        Button("Calculate") {
                            print("Hello")
                            if let amount = amount, let interestRate = interestRate, let term = term {
                            loan = Loan(amount: amount, interestRate: interestRate / 100, term: term, name: "")
                                print(loan?.payment)
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
                            self.text = " "
                            self.isPresented = true
                        }
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    
                    
                   
                }.navigationTitle("Loan Calculator")
                
                alertTextField(title: "Type a name", isShown: $isPresented, text: $text, onDone: {
                    text in
                    
                    if let amount = amount, let interestRate = interestRate, let term = term {
                        LoanController.data.append(Loan(amount: amount, interestRate: interestRate, term: term, name: text))
                        print(LoanController.data)
                    }
                    
                    
                 }
                
                )
                
            }
        }
        
        
        }
        
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
