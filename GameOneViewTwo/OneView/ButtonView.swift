//
//  ButtonView.swift
//  GameOneViewTwo
//
//  Created by Ivan Dimitrov on 1.10.20.
//

import SwiftUI

struct ButtonView: View {
    
    @Binding var isPressed : Bool
             var name : String
    
    var body: some View {
        Button(action: {
            self.isPressed.toggle()
        }) {
            Text(self.name)

        }
        .buttonStyle(NeumorphicButtonStyle3(bgColor: Color.init(hex: "F0F0F3"), isPressed: isPressed))
        .scaleEffect(self.isPressed ? 0.95: 1)
        .foregroundColor(self.isPressed ? .gray : .primary)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView( isPressed: .constant(true), name: "aa")
    }
}
