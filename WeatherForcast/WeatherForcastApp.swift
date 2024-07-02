//
//  WeatherForcastApp.swift
//  WeatherForcast
//
//  Created by Pham Thi Thu Ha on 30/06/2024.
//

import SwiftUI

@main
struct WeatherForcastApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
