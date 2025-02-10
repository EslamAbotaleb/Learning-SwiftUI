//
//  DCNetworkingServiceApp.swift
//  DCNetworkingService
//
//  Created by Eslam on 09/02/2025.
//

import SwiftUI

@main
struct DCNetworkingServiceApp: App {
    @StateObject var container = DependencyContainer()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(container)
        }
    }
}
