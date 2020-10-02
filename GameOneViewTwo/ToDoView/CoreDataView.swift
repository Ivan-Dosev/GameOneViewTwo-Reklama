//
//  CoreDataView.swift
//  ToDoArda
//
//  Created by Ivan Dosev Dimitrov on 25.09.20.
//  Copyright © 2020 Ivan Dosev Dimitrov. All rights reserved.
//

import SwiftUI
import CoreData

struct CoreDataView: View {
    
    @State var width = UIScreen.main.bounds.width
    @State var height = UIScreen.main.bounds.height
    @State var isButtonPlus : Bool   = false
    @State var isShow       : Bool   = false
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Alo.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Alo.day, ascending: true),NSSortDescriptor(keyPath: \Alo.time, ascending: true),NSSortDescriptor(keyPath: \Alo.title, ascending: true)]) var alo: FetchedResults<Alo>
  
    
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
                        Text("⏎")
                            .frame(width: 50, height: 7, alignment: .center)
                            .padding()
                            
                            
                            .foregroundColor(Color.black)
                            .background(Color.white.cornerRadius(10).shadow(radius: 5))
                            .blendMode(.darken)
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(lineWidth: 2).foregroundColor(Color.white))
                            .foregroundColor(Color.white)
                            .shadow(color: Color.gray, radius: 2)
                            .offset(x:self.width > 700 ? 50 : 0,  y:self.width > 700 ? -100 : -40)
                     Spacer()
                        Text("✚")
                     //   Image(systemName: "plus.circle")
                        
                            .frame(width: 50, height: 50, alignment: .center)
                            .padding()
                            
                            .foregroundColor(Color.black)
                            .background(Color.white.cornerRadius(10).shadow(radius: 5))
                            .blendMode(.darken)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(lineWidth: 2).foregroundColor(Color.white) .scaleEffect( self.isButtonPlus ? 1.2 : 1))
                            .foregroundColor(Color.white)
                            .shadow(color: Color.gray, radius: 2)
                           // .offset( y: -20)
                            .onTapGesture { self.isButtonPlus.toggle()
                                            self.isShow.toggle()
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
                                    self.isButtonPlus.toggle()
                                }
                                
                          
                        }
                        Spacer()
                        EditButton()

                            .frame(width: 50, height: 7, alignment: .center)
                            .padding()
                            
                            
                            .foregroundColor(Color.black)
                            .background(Color.white.cornerRadius(10).shadow(radius: 5))
                            .blendMode(.darken)
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(lineWidth: 2).foregroundColor(Color.white))
                            .foregroundColor(Color.white)
                            .shadow(color: Color.gray, radius: 2)
                            .offset(x:self.width > 700 ? -50 : 0,  y:self.width > 700 ? -100 : -40)
                            .animation(.spring(response: 0.0, dampingFraction:0.2))
                    }
                    .padding()
                    .frame(width: self.width, alignment: .center)
            //    VStack(spacing: self.width * 0.8) {
                  VStack() {
                  
                    List{
                        ForEach(Array(zip(self.alo , self.alo.indices)) ,id: \.0) { ( item , index ) in
                           Group {
                                HStack {
                                       Text(item.symbol ? "●" : "○")
                                        .foregroundColor(item.symbol ? Color.green : Color.gray)
                                         .onTapGesture { self.saveSymbol(index: index) }
                                       Text(item.title!)
                                    Spacer()

                                    VStack{
                                        Text(item.day!)
                                            .font(.system(size: 10))
                                        Text(item.time!)
                                            .font(.system(size: 10))
                                    }
                                    
                                    Text( item.isOnArrow ?  "▼" : "▶︎")
                                        .padding()
                                        .foregroundColor(Color.black)
                                        .background(Color.white.cornerRadius(10).shadow(radius: 5))
                                        .blendMode(.darken)
                                        .onTapGesture { self.saveOnArrow(index: index) }
                                       
                                        
                                }
                            if item.isOnArrow {
                                HStack {
                                         Text("\t\t")
                                         Text(item.msg  ?? "unknow")
                                 }
                            }

                            }
                        }.onDelete(perform: deleteItem)
                    }
                    
                }
                .frame(width: self.width / 1.1 , height: self.height / 1.3)
                .foregroundColor(Color.black)
                .background(Color.white.cornerRadius(10).shadow(radius: 5))
                .blendMode(.darken)
                
            }
            .sheet(isPresented: self.$isShow ){ SaveView(isShow: self.$isShow).environment(\.managedObjectContext , moc) }
        }
    }
    
    func saveOnArrow(index: Int){
        let symbolNote = self.alo[index]
            symbolNote.isOnArrow.toggle()
        do{
            try! self.moc.save()
        }
        
    }
    
    func saveSymbol(index: Int){
        let symbolNote = self.alo[index]
            symbolNote.symbol.toggle()
        do{
            try! self.moc.save()
        }
        
    }
    
    func deleteItem(indexSet: IndexSet) {
        let deleteItem = self.alo[indexSet.first!]
                         self.moc.delete(deleteItem)
        
        do{
            try! self.moc.save()
        }
    }
}

struct CoreDataView_Previews: PreviewProvider {
    static var previews: some View {
//        CoreDataView()
        Text("arda")
    }
}
