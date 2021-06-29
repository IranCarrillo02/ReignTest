//
//  ExamReignApp.swift
//  ExamReign
//
//  Created by Iran Carrillo Guzman on 6/28/21.
//

import SwiftUI

@main
struct ExamReignApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
