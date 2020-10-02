//
//  ContView.swift
//  Timer3
//
//  Created by Ivan Dimitrov on 29.09.20.
//

import SwiftUI

struct ContView: View {
    var onDismiss: () -> ()

    @State var isShow:  Bool = false
    @State var isShow2: Bool = false
    @State private var selections: [Int] = [1, 0, 0]
    @State var width = UIScreen.main.bounds.width
    @EnvironmentObject var timeOnOff : TimeOnOff
    @State var dossi : Int = 0
    
    @State          var pauseValue       : Int = 0
    @State          var isPause          : Bool = false
    @State          var isOn             : Bool = true
    var timer : Timer {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true)  { _ in
            self.dossi = timeOnOff.pauseValue
        }
    }

    
    var body: some View {

        var countTo: Int {
            let hours = selections[0] * 60 * 60
            let minutes =  selections[1] * 60
            let seconds = selections[2]
            return hours + minutes + seconds
        }
      return  ZStack{
            Color.init(hex: "F0F0F3")
                .edgesIgnoringSafeArea(.all)
           

                VStack{
                    if self.isShow {
                        VStack {
                            ZStack(alignment: .top ) {
                            ProgressBar( end: countTo)
                                .offset(y: 90)
                                TextTimer( end: countTo, isPause : self.$isPause )
                                .offset(y: 150)

//                                if timeOnOff.pauseValue > 0{
//                                    MiniTextTimer(end: timeOnOff.pauseValue)
//                                    .offset(y: 250)
//                                }
                                if self.dossi != 0{
                                    MiniTextTimer(end: self.dossi)
                                      .offset(y: 250)
                                }

                              
                           }
                            if isShow2 {
                                PauseButtons(bgColor: Color.init(hex: "F0F0F3"), isOn: $isOn )
                                .offset(y: +176)
                            }

                        }
                        Button(action: {
                            if  self.isOn {
                                self.isShow2.toggle()
                            } else {
                                timeOnOff.pauseValue = 0
                                self.isOn = true
                                self.isShow2.toggle()
                            }

                        }) {
                            Text(self.isShow2 ? "Cancel" : "Pause")
                        }
                        .buttonStyle(NeumorphicButtonStyle(bgColor: Color.init(hex: "F0F0F3"), isPressed: isShow2))
                        .offset(y: +126)
                    } else {

                            PickerTime( selections: $selections)
                                .offset(y: 50)
                 

                    }
                }
                .frame(height: 400)
                .offset(y: -250)
                VStack{
                    Button(action: {
                        self.isShow.toggle()

                        if self.isShow {
                            timeOnOff.resumeTimer()
                        }
                        else{
                            timeOnOff.start = 0
                            timeOnOff.pauseTimer()
                        }
                        
                        
                    }) {
                        Text(self.isShow ? "Stop" : "Play")
                    }
                    .buttonStyle(NeumorphicButtonStyle(bgColor: Color.init(hex: "F0F0F3"), isPressed: isShow ))
                }
                .offset(y: -20)
      }.onAppear(){
        
                    timer
                    timeOnOff.pauseTimer()
//        if timeOnOff.start != 0 {
//            self.isShow = true
//            timeOnOff.resumeTimer()
//            timer
//        }
//        else{
//            self.isShow = false
//            timer
//            timeOnOff.pauseTimer()
//        }
      }
      .gesture(DragGesture()
                .onChanged({ value in
                    if  self.isShow && value.location.y > 100{
                        timeOnOff.pauseValue  = 0
                        timeOnOff.start       = 0
                        self.isShow = true
                     
                        timeOnOff.start = 0
                        timeOnOff.pauseTimer()
                        
                        self.onDismiss()
                    }
            }))
    }
}

struct ContView_Previews: PreviewProvider {
    static var previews: some View {
//        ContView( )
        Text("aa")
    }
}
