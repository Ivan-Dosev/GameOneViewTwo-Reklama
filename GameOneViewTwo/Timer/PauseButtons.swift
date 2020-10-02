//
//  PauseButtons.swift
//  Timer
//
//  Created by Ivan Dimitrov on 15.09.20.
//  Copyright © 2020 Ivan Dosev Dimitrov. All rights reserved.
//

import SwiftUI

struct PauseButtons: View {
    @EnvironmentObject var timeOnOff : TimeOnOff
    var bgColor: Color
    @State private  var isPressedButton5 : Bool = false
    @State private  var isPressedButton10: Bool = false
    @State private  var isPressedButton15: Bool = false
    @State private  var isPressedButton30: Bool = false
    @State private  var isPressedButton60: Bool = false
    @State private  var isPressedButton90: Bool = false
//    @ObservedObject var timeOnOff = TimeOnOff()
    @State          var whidth  = UIScreen.main.bounds.width
    @Binding var isOn : Bool
    

      
    var body: some View {
        VStack {
                ZStack {
                    Button(action: {
                        if self.isOn {
                            self.isPressedButton5.toggle()
                            timeOnOff.pauseValue = 10
                        }
                        self.isOn = false


                    }) {
                        Text("      5 min      ")
                    }
                    .buttonStyle(NeumorphicButtonStyle2(bgColor: Color.init(hex: "F0F0F3"), isPressed: isPressedButton5))
                    .scaleEffect(self.isPressedButton5 ? 0.95: 1)
                    .foregroundColor(self.isPressedButton5 ? .gray : .primary)
                    .offset(x: -110, y: (self.whidth / 11)+80)
                    .disabled(self.isPressedButton10 || self.isPressedButton15 || self.isPressedButton30 || self.isPressedButton60 || self.isPressedButton90 )
                    
                    Button(action: {
                        if self.isOn {
                            self.isPressedButton10.toggle()
                            timeOnOff.pauseValue = 600
                        }
                        self.isOn = false

                        
                    }) {
                        Text("      10 min      ")
                    }
                    .buttonStyle(NeumorphicButtonStyle2(bgColor: Color.init(hex: "F0F0F3"), isPressed: isPressedButton10))
                    .scaleEffect(self.isPressedButton10 ? 0.95: 1)
                    .foregroundColor(self.isPressedButton10 ? .gray : .primary)
                    .offset(x: 0, y: (self.whidth / 11)+80)
                    .disabled(self.isPressedButton5 || self.isPressedButton15 || self.isPressedButton30 || self.isPressedButton60 || self.isPressedButton90 )
                    
                    Button(action: {
                        if self.isOn {
                            self.isPressedButton15.toggle()
                            timeOnOff.pauseValue = 900
                        }
                        self.isOn = false

                        
                    }) {
                        Text("      15 min      ")
                    }
                    .buttonStyle(NeumorphicButtonStyle2(bgColor: Color.init(hex: "F0F0F3"), isPressed: isPressedButton15))
                    .scaleEffect(self.isPressedButton15 ? 0.95: 1)
                    .foregroundColor(self.isPressedButton15 ? .gray : .primary)
                    .offset(x: 110, y: (self.whidth / 11)+80)
                    .disabled(self.isPressedButton10 || self.isPressedButton5 || self.isPressedButton30 || self.isPressedButton60 || self.isPressedButton90 )
                    
                    Button(action: {
                        if self.isOn {
                            self.isPressedButton30.toggle()
                            timeOnOff.pauseValue = 1800
                        }
                        self.isOn = false

                        
                    }) {
                        Text("      30 min      ")
                    }
                    .buttonStyle(NeumorphicButtonStyle2(bgColor: Color.init(hex: "F0F0F3"), isPressed: isPressedButton30))
                    .scaleEffect(self.isPressedButton30 ? 0.95: 1)
                    .foregroundColor(self.isPressedButton30 ? .gray : .primary)
                    .offset(x: -110, y: (self.whidth / 11)+160)
                    .disabled(self.isPressedButton10 || self.isPressedButton15 || self.isPressedButton5 || self.isPressedButton60 || self.isPressedButton90 )
                    
                    
                    Button(action: {
                        if self.isOn {
                            self.isPressedButton60.toggle()
                            timeOnOff.pauseValue = 3600
                        }
                        self.isOn = false

                        
                    }) {
                        Text("      60 min      ")
                    }
                    .buttonStyle(NeumorphicButtonStyle2(bgColor: Color.init(hex: "F0F0F3"), isPressed: isPressedButton60))
                    .scaleEffect(self.isPressedButton60 ? 0.95: 1)
                    .foregroundColor(self.isPressedButton60 ? .gray : .primary)
                    .offset(x: 0, y: (self.whidth / 11)+160)
                    .disabled(self.isPressedButton10 || self.isPressedButton15 || self.isPressedButton30 || self.isPressedButton5 || self.isPressedButton90 )
                    
                    
                    Button(action: {
                        if self.isOn {
                            self.isPressedButton90.toggle()
                            timeOnOff.pauseValue = 5400
                        }
                        self.isOn = false

                        
                    }) {
                        Text("      90 min      ")
                    }
                    .buttonStyle(NeumorphicButtonStyle2(bgColor: Color.init(hex: "F0F0F3"), isPressed: isPressedButton90))
                    .scaleEffect(self.isPressedButton90 ? 0.95: 1)
                    .foregroundColor(self.isPressedButton90 ? .gray : .primary)
                    .offset(x: 110, y: (self.whidth / 11)+160)
                    .disabled(self.isPressedButton10 || self.isPressedButton15 || self.isPressedButton30 || self.isPressedButton60 || self.isPressedButton5 )
                }
            }
        }
    }
