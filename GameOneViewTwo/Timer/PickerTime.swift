//
//  SwiftUIView.swift
//  Timer
//
//  Created by Ivan Dimitrov on 15.09.20.
//  Copyright © 2020 Ivan Dosev Dimitrov. All rights reserved.
//

import SwiftUI

import SwiftUI

struct PickerTime: View {
    
    var width = UIScreen.main.bounds.width
    
    private let data: [[String]] = [
        Array(0...24).map { "\($0)" + " h"},
        Array(0...59).map { "\($0)" + " m"},
        Array(0...59).map { "\($0)" + " s"}
    ]

    @Binding var selections: [Int]
    var body: some View {
        ZStack {
             Color.init(hex: "F0F0F3")
                .edgesIgnoringSafeArea(.all)
        VStack {
            ZStack{
                ZStack{
                    Text("     \(selections[0]) hours")
                        .offset(x: -90)
                    Text("     \(selections[1]) min")
                    Text("     \(selections[2]) sec")
                        .offset(x: 90)
                }
                .frame(width: width / 1.2, height: 50)
                .background(Color.init(hex: "F0F0F3"))
                .cornerRadius(10)
            }
            .shadow(color: Color.white, radius: 5, x: -5, y: -5)
            .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 5, y: 5)

            ZStack{
                VStack {
                    PickerView(data: self.data, selections: self.$selections)
                        .frame(width: width / 1.2)
                }
                .frame(width: width / 1.2, height: 200)
                .background(Color.init(hex: "F0F0F3"))
                .cornerRadius(10)
            }
            .shadow(color: Color.white, radius: 5, x: -5, y: -5)
            .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 5, y: 5)
        }
    }
    }
    func getSeconds() -> Int{
        let hours   =  selections[0] * 60 * 60
        let minutes =  selections[1] * 60
        let seconds =  selections[2]
        return hours + minutes + seconds
    }
    }

struct PickerView: UIViewRepresentable {
    var data: [[String]]
    @Binding var selections: [Int]

    //makeCoordinator()
    func makeCoordinator() -> PickerView.Coordinator {
        Coordinator(self)
    }

    //makeUIView(context:)
    func makeUIView(context: UIViewRepresentableContext<PickerView>) -> UIPickerView {
        let picker = UIPickerView(frame: .zero)
        
        picker.dataSource = context.coordinator
        picker.delegate = context.coordinator
        
        return picker
    }

    //updateUIView(_:context:)
    func updateUIView(_ view: UIPickerView, context: UIViewRepresentableContext<PickerView>) {
        for i in 0...(self.selections.count - 1) {
            view.selectRow(self.selections[i], inComponent: i, animated: false)
        }
    }

    class Coordinator: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
        var parent: PickerView

        //init(_:)
        init(_ pickerView: PickerView) {
            self.parent = pickerView
        }

        //numberOfComponents(in:)
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return self.parent.data.count
        }

        //pickerView(_:numberOfRowsInComponent:)
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return self.parent.data[component].count
        }

        //pickerView(_:titleForRow:forComponent:)
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return self.parent.data[component][row]
        }

        //pickerView(_:didSelectRow:inComponent:)
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            self.parent.selections[component] = row
        }
    }
}

