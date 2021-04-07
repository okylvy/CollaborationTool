//
//  CollaborationToolApp.swift
//  CollaborationTool
//
//  Created by hiroki on 2021/03/06.
//

import SwiftUI
import Firebase

@main
struct CollaborationToolApp: App {

    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

