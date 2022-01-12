//
//  ContentView.swift
//  InterestCalculator
//
//  Created by Brayden Lemke on 1/6/22.
//

import SwiftUI



struct LoanCalculator: View {
    
    @State private var amount: Int? = nil
    @State private var interestRate: Double? = nil
    @State private var term: Int? = nil
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $amount, formatter: NumberFormatter())
                    TextField("Interst Rate", value: $interestRate, formatter: NumberFormatter())
                    TextField("Term", value: $term, formatter: NumberFormatter())
                    
                }
                Section {
                    Button("Calculate") {
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
                        Image(systemName: "dollarsign.circle")
                            .resizable()
                            .background(Color.gray)
                            .frame(width: 200, height: 200, alignment: .center)
                            .padding()
                        
                        
                    }
                }
                
                Section {
                    Button("Submit") {
                        print("Hello")
                    }
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(20)
                
                
            }.navigationTitle("Loan Calculator")
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoanCalculator()
    }
}
