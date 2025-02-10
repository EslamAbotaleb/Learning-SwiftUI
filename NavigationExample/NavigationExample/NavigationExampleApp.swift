//
//  NavigationExampleApp.swift
//  NavigationExample
//
//  Created by Eslam on 09/02/2025.
//

import SwiftUI

@main
struct NavigationExampleApp: App {
    @StateObject private var pathStore = PathStore()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(pathStore)
        }
    }
}
