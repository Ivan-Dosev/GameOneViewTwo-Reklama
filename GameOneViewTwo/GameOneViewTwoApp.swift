//
//  GameOneViewTwoApp.swift
//  GameOneViewTwo
//
//  Created by Ivan Dimitrov on 29.09.20.
//

import SwiftUI

@main
struct GameOneViewTwoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            let settings = TimeOnOff()
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(settings)
        }
    }
}
/*
 var settings = TimeOnOff()
 ContentView().environmentObject(settings)
 */
