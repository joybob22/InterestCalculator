//
//  alertTextField.swift
//  InterestCalculator
//
//  Created by Luis Madriz on 1/12/22.
//

import SwiftUI
import Charts

struct alertTextField: View {
    
    let screenSize = UIScreen.main.bounds
    @Environment(\.colorScheme) var colorScheme
    
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
            .frame(width: screenSize.width * 0.6, height: screenSize.height * 0.2, alignment: .center)
            .background(colorScheme == .dark ? Color(.sRGB, red: 0.14, green: 0.14, blue: 0.15, opacity: 1) : Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 20.0, style: .continuous))
            .offset(y: isShown ? 0 : screenSize.height)
            //.animation(.spring())
            .shadow(color: colorScheme == .dark ? Color(.sRGB, red: 0.3, green: 0.3, blue: 0.3, opacity: 1): Color.gray, radius: 6, x: 1, y: 1)
    }
}

struct alertTextField_Previews: PreviewProvider {
    static var previews: some View {
        alertTextField(isShown: .constant(true), text: .constant("Type a name"))
    }
}
