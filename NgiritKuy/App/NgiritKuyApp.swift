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
        let schema = Schema([
            Stall.self,
            FoodMenu.self,
            GOPArea.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        
        let container: ModelContainer
        do {
            container = try ModelContainer(for: schema, configurations: [modelConfiguration])
            
            // Seed data if needed
            Task {
                await seedData(ModelContext(container))
            }
            
            return container
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

struct ContentView_Previews: PreviewProvider {
    static var previewContainer: ModelContainer = {
        // Create an in-memory model container for seeding previews
        let schema = Schema([
            Stall.self,
            FoodMenu.self,
            GOPArea.self,
        ])
        let modelConfiguration =
        ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        let container: ModelContainer
        
        do {
            container = try ModelContainer(
                for: schema,
                configurations: [modelConfiguration]
            )
        } catch {
            fatalError("Could not create in-memory ModelContainer: \(error)")
        }
        
        // Seed the container asynchronously.
        Task {
            await seedData(ModelContext(container))
        }
        
        return container
    }()
    
    static var previews: some View {
        ContentView()
            .modelContainer(previewContainer)
    }
}
