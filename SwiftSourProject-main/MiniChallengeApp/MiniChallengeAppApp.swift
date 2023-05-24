//
//  MiniChallengeAppApp.swift
//  MiniChallengeApp
//
//  Created by Walter Galiano on 24/10/22.
//

import SwiftUI
import CoreData

@main
struct MiniChallengeAppApp: App {
    @StateObject var vm = CoreDataRelationshipsViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext,vm.container.viewContext)
        }
    }
}
