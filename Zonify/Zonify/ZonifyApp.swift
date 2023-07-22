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
    @State private var value = false
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            AppView(isLoggedIn: value, email: "")
        }
    }
}
