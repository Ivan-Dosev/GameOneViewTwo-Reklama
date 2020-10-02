//
//  MiniTextTimer.swift
//  Timer3
//
//  Created by Ivan Dimitrov on 21.09.20.
//

import Foundation
import SwiftUI

struct MiniTextTimer: View {

    @State var start: Int = 0
           var end: Int = 0
           var currentTime : Int { end - start }
    
    var body: some View {
        VStack {
            Text(timeFormatting(seconds: currentTime))
                .font(.custom("Avenir Next", size: 20))
                .foregroundColor(Color.gray)
            Spacer()
        }
    }
    
    func timeFormatting(seconds: Int) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .positional
        return formatter.string(from: TimeInterval(seconds))!
    }
}

struct MiniTextTimer_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
