//
//  FIREMessageApp.swift
//  FIREMessage
//
//  Created by Filippo Cilia on 20/06/2023.
//

import Firebase
import SwiftUI

@main
struct FIREMessageApp: App {
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
