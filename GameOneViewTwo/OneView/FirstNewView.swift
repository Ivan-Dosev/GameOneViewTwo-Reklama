//
//  FirstNewView.swift
//  GameOneViewTwo
//
//  Created by Ivan Dimitrov on 1.10.20.
//

import SwiftUI

struct FirstNewView: View {
    @State var width = UIScreen.main.bounds.width
    @State var height = UIScreen.main.bounds.height
    @State var isPressed : Bool = false
    
    @State var isTimer     : Bool = false
    @State var isCoreData  : Bool = false
    @State var isSetting   : Bool = false
    
    @State var isPolivane  : Bool = false
    @State var isTorene    : Bool = false
    @State var isTretirane : Bool = false

    var body: some View {
        ZStack {
            Color.init(hex: "F0F0F3")
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    
                    Spacer()
                    ButtonView(isPressed: self.$isPolivane, name: "Polivane")
                    .offset(y: self.width < 700 ? 30 : 50)

                 Spacer()
                    VStack{
                        ButtonView(isPressed: self.$isTorene, name: "Torene")
                        .offset(y: self.width < 700 ? 45 : 70)
                        Text("2000")
                            .offset(y: self.width < 700 ? 70 : 170)
                    }
                    Spacer()
                    ButtonView(isPressed: self.$isTretirane, name: "Tretirane")
                   .offset(y: self.width < 700 ? 30 : 50)
                    Spacer()
                }
                .frame(width: UIScreen.main.bounds.width, height: 100, alignment: .center)
                .background(Color.init(hex: "F0F0F3").clipShape(CustomShape(mod: self.width < 700 ? 0.55 : 0.45)).shadow(radius: 5))
                .blendMode(.darken)
              
                Spacer()
                         Image("123")
                          .resizable()
                          .scaledToFit()
                          .frame(height: 600)
                    
                Spacer()
                
                HStack {
                    
                    Spacer()
                    ButtonView(isPressed: self.$isTimer, name: "Timer")
                    .offset(y: self.width < 700 ? 0 : -70)
                        .sheet(isPresented: self.$isTimer, content: { ContView(onDismiss: {self.isTimer = false}) })

                    Spacer()
                    ButtonView(isPressed: self.$isSetting, name: "Setting")
                    .offset(y: self.width < 700 ? 0 : -70)
                    Spacer()
                    ButtonView(isPressed: self.$isCoreData, name: "CoreData")
                    .offset(y: self.width < 700 ? 0 : -70)
                    Spacer()


                }
                .frame(width: UIScreen.main.bounds.width, height: 100, alignment: .center)
                .background(Color.init(hex: "F0F0F3").clipShape(Rectangle()).shadow(radius: 5))
                .blendMode(.darken)
                
            } .edgesIgnoringSafeArea(.all)
            
        }
    }
}

struct FirstNewView_Previews: PreviewProvider {
    static var previews: some View {
        FirstNewView()
    }
}


