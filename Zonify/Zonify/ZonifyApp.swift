//
//  ZonifyApp.swift
//  Zonify
//
//  Created by My Mac on 7/19/23.
//

import SwiftUI
import FirebaseCore

@main
struct ZonifyApp: App {
 
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}
