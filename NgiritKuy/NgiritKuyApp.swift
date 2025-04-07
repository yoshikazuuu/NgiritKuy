//
//  NgiritKuyApp.swift
//  NgiritKuy
//
//  Created by Jerry Febriano on 07/04/25.
//

import SwiftData
import SwiftUI

@main
struct NgiritKuyApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([])
        let modelConfiguration = ModelConfiguration(
            schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(
                for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
