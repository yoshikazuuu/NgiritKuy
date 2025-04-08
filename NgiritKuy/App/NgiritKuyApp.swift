import SwiftData
import SwiftUI
import TipKit

@main
struct NgiritKuyApp: App {
    let sharedModelContainer: ModelContainer

    init() {
        // #DEBUG (REMOVE LATER)
        try? Tips.resetDatastore()
        try? Tips.configure()

        let schema = Schema([
            Stall.self,
            FoodMenu.self,
            GOPArea.self,
        ])
        let modelConfiguration = ModelConfiguration(
            schema: schema,
            isStoredInMemoryOnly: false
        )

        do {
            // 1. Create the container (assign to a local constant first)
            let container = try ModelContainer(
                for: schema,
                configurations: [modelConfiguration]
            )
            // 2. Assign the created container to the instance property 'self'
            self.sharedModelContainer = container

            // 3. Check and Seed Data AFTER container creation
            // Explicitly capture the 'container' constant in the Task's capture list
            // This avoids capturing 'self'
            Task { [container] in  // <-- FIX: Explicit capture list
                // Explicitly run on MainActor for safety with ModelContext
                await MainActor.run {
                    Self.seedInitialDataIfNeeded(
                        // Use the captured container constant
                        context: ModelContext(container)
                    )
                }
            }

        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }

    // Helper function to check if seeding is needed
    @MainActor
    static func seedInitialDataIfNeeded(context: ModelContext) {
        // Check if data already exists (e.g., by fetching one Stall)
        let descriptor = FetchDescriptor<Stall>()
        do {
            let count = try context.fetchCount(descriptor)
            if count == 0 {
                // No data found, proceed with seeding
                print("Persistent store is empty. Seeding initial data...")
                // Call the actual seeding function (defined in Utils.swift)
                seedData(context, allFoodCourtStalls)
                print("Finished seeding persistent store.")
            } else {
                // Data already exists
                print("Persistent store already contains data. Skipping seed.")
            }
        } catch {
            print("Failed to fetch data to check for seeding: \(error)")
            // Handle the error appropriately
        }
    }
}

// --- Previews Setup (remains the same as the previous corrected version) ---

@MainActor
let previewContainer: ModelContainer = {
    let schema = Schema([
        Stall.self,
        FoodMenu.self,
            // GOPArea.self, // REMOVE THIS if GOPArea is an Enum
    ])
    let modelConfiguration = ModelConfiguration(
        schema: schema,
        isStoredInMemoryOnly: true
    )

    do {
        let container = try ModelContainer(
            for: schema,
            configurations: [modelConfiguration]
        )
        print("Seeding preview (in-memory) container...")

        // Use the same seedData function, but with the preview context
        Task { [container] in  // Capture container here too for consistency
            await MainActor.run {  // Explicitly run on MainActor
                seedData(ModelContext(container), [uenaMieChiliOilStallData])
                print("Finished seeding preview container.")
            }
        }
        return container
    } catch {
        fatalError(
            "Could not create in-memory preview ModelContainer: \(error)")
    }
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .modelContainer(previewContainer)
            .task {
                #if DEBUG
                    try? Tips.resetDatastore()
                #endif
                try? Tips.configure([
                    .displayFrequency(.immediate),
                    .datastoreLocation(.applicationDefault),
                ])
                print("TipKit configured for Preview")
            }
    }
}
