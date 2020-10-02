//
//  ProgressBar.swift
//  Timer
//
//  Created by Ivan Dimitrov on 14.09.20.
//  Copyright © 2020 Ivan Dosev Dimitrov. All rights reserved.
//

import SwiftUI

struct ProgressBar: View {
    @EnvironmentObject var timeOnOff : TimeOnOff
    @State var start: Int = 0
    @State var end: Int
    var progress : CGFloat { (CGFloat(start) / CGFloat(end)) }
    
    var timer : Timer {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true){_ in
            if self.start != self.end {
                self.start = timeOnOff.start
                timeOnOff.end = self.end
            }

        }
    }
    
    var body: some View {
        VStack{
            Circle()
                .fill(Color.init(hex: "F0F0F3"))
                .frame(width: 250, height: 250)
                .shadow(color: Color.gray, radius: 3)
                .overlay(
                    Circle().trim(from: progress, to: 1)
                        .stroke(
                            style: StrokeStyle(
                                lineWidth: 8,
                                lineCap: .round,
                                lineJoin:.round
                            )
                    )
                        .foregroundColor(
                           (progress == 1 ? Color.green : Color.init(hex: "64C0AB"))
                    ).animation( .easeInOut(duration: 0.2))
            )
        }.onAppear(){ timer }
    }
}
