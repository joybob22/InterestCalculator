//
//  alertTextField.swift
//  InterestCalculator
//
//  Created by Luis Madriz on 1/12/22.
//

import SwiftUI

struct alertTextField: View {
    
    let screenSize = UIScreen.main.bounds
    
    var title: String = ""
    @Binding var isShown: Bool
    @Binding var text: String
    var onDone: (String) -> Void = { _ in }
    var onCancel: () -> Void = { }
    
    
    
    var body: some View {
        VStack {
            
            Text(title)
            TextField("", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            HStack {
                Button("Done") {
                    self.isShown = false
                    self.onDone(self.text)
                }
                Button("Cancel") {
                    self.isShown = false
                    self.onCancel()
                }
            }
            
            
        } .padding()
            .frame(width: screenSize.width * 0.7, height: screenSize.height * 0.3, alignment: .center)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 20.0, style: .continuous))
            .offset(y: isShown ? 0 : screenSize.height)
            //.animation(.spring())
            .shadow(color: Color.gray, radius: 6, x: 9, y: 12)
    }
}

struct alertTextField_Previews: PreviewProvider {
    static var previews: some View {
        alertTextField(isShown: .constant(true), text: .constant(""))
    }
}
