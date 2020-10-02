//
//  SaveView.swift
//  ToDoViewNotes
//
//  Created by Ivan Dosev Dimitrov on 27.09.20.
//  Copyright © 2020 Ivan Dosev Dimitrov. All rights reserved.
//

import SwiftUI
import CoreData

struct SaveView: View {
    
    
    let toDay = Date()
    var dateFormatter: DateFormatter {
        let format = DateFormatter()
            format.dateStyle = .short
     return format
    }

    var timeFormatter : DateFormatter {
        let format = DateFormatter()
            format.timeStyle = .medium
     return format
    }
    
    @Environment(\.managedObjectContext) var moC
    
    @State var width = UIScreen.main.bounds.width
    @State var height = UIScreen.main.bounds.height
    
    @State var msgField      :String = "Notes"
    @State var titleField    :String = ""
    @Binding var isShow      : Bool
    
    var body: some View {
        
        ZStack {
            Color.black.opacity(0.05)
                .edgesIgnoringSafeArea(.all)
            Circle()
                .fill(Color.white)
                .frame(width: self.width * 3, height: self.width  * 3 , alignment: .center)
                .padding(.horizontal, -100)
                .offset(y:  self.width > 700 ? -(self.width * 2.0) :  -(self.width * 2.3))
                .shadow(radius: 5)
                .blendMode(.darken)
            
            VStack {
              HStack {

                Spacer()
                
                Button(action: {
                              self.saveTitleOn()
                              self.isShow.toggle()
                }) {
                   
                    Text("Save")
                        .fontWeight(.bold)
                        .frame(width: 50, height: 50, alignment: .center)
                        .padding()
                        
                        .foregroundColor(Color.black)
                        .background(Color.white.cornerRadius(10).shadow(radius: 5))
                        .blendMode(.darken)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(lineWidth: 2).foregroundColor(Color.white) )
                        .foregroundColor(Color.white)
                        .shadow(color: Color.gray, radius: 2)
                }


                  Spacer()
                
              }
              .padding()
              .frame(width: self.width, alignment: .center)
                  VStack {
                    HStack{
                        
                        TextField("title ...", text: self.$titleField)
                        .padding()
                         
                    }
                    .frame( height: 50, alignment: .center)
                    .foregroundColor(Color.black)
                    .background(Color.white.cornerRadius(10).shadow(radius: 5))
                    .blendMode(.darken)
                    
                   MultiLine(txt: self.$msgField)
                    .padding()
                    
                    Spacer()
                  }
                .frame(width: self.width / 1.1 , height: self.height / 1.3)
                .foregroundColor(Color.black)
                .background(Color.white.cornerRadius(10).shadow(radius: 5))
                .blendMode(.darken)
            }
        }
    }
    func saveTitleOn() {
        
     
            let txtdata       = Alo(context: moC)
                txtdata.id    = UUID()
                txtdata.title = self.titleField
                txtdata.msg   = String(self.msgField)
                txtdata.time = timeFormatter.string(from: toDay)
                txtdata.day = dateFormatter.string(from: toDay)

            do {
                try  self.moC.save()
                
            }catch{
                print(".... no ....")
            }
  

    }
}


struct SaveView_Previews: PreviewProvider {
    static var previews: some View {
        SaveView( isShow: .constant(false))
    }
}

struct MultiLine: UIViewRepresentable {

    @Binding var txt : String
    
    func makeCoordinator() -> MultiLine.Coordinator {
        
        return MultiLine.Coordinator(parent1: self)
        
    }
    func makeUIView(context: UIViewRepresentableContext<MultiLine>) -> UITextView{
        
        let textview = UITextView()
        textview.font = .systemFont(ofSize: 18)
        textview.delegate = context.coordinator
        return textview
    }
    
    func updateUIView(_ uiView: UITextView, context: UIViewRepresentableContext<MultiLine>) {
        
        uiView.text = txt
    }
    
    class Coordinator : NSObject,UITextViewDelegate{
        
        var parent : MultiLine
        
        init(parent1 : MultiLine) {
            
            parent = parent1
        }
        
        func textViewDidChange(_ textView: UITextView) {
            
            self.parent.txt = textView.text
        }
    }


}
