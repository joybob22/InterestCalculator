//
//  NewPayment.swift
//  InterestCalculator
//
//  Created by Luis Madriz on 1/24/22.
//

import SwiftUI

struct NewPayment: View {
    
    @State private var newPayment: Double? = nil
    @State var loan: Loan
   
    
    var body: some View {
        
        
        
        
        NavigationView {
            VStack {
                
                Form {
                    
                    Section {
                        Text("Name: \(loan.name)")
                        Text("Term: \(loan.term)")
                        Text("Interst Rate: \(loan.interestRate)")
                        Text("Payment: \(loan.payment)")
                        
                    }
                    
                    Section {
                        
                        TextField("New Payment:", value: $newPayment, formatter: NumberFormatter()).font(.title2).padding().background(Color(.systemBlue)).clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous)).shadow(radius: 10).keyboardType(.decimalPad)
                            
                    }
                    
                    //NavigationLink("See amortization table", destination: AmoritizationView(amoritization: ))
                    
                    
                    Section {
                        Text("New Interest payment:")
                        Text("New Term:")
                        Text("Old Interst payment:")
                        Text("Old Term")
                        
                        
                    }
                    
                   
                    
                    
                    Section {
                        Button("Save New Payment") {
                            print("Do the saving action")
                        }
                    }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                     .background(Color.blue).foregroundColor(.white).cornerRadius(20)
                }
                

                
            }.navigationTitle("New Payment")
            
        }
        

    }
}

struct NewPayment_Previews: PreviewProvider {
    static var previews: some View {
        NewPayment(loan: LoanController.testData[0])
    }
}
