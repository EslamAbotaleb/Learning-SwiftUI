//
//  ContentView.swift
//  NavigationManagement
//
//  Created by Eslam on 10/02/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var router: Router<RoutesNames> = .init()
    var body: some View {
        RoutingView(stack: $router.stack) {
            List {
                Button("Home") {
                    router.navigate(to: .home)
                }
                Button("Profile") {
                    router.navigate(to: .profile(userID: UUID()))
                }
                Button("Settings") {
                    router.navigate(to: .settings)
                }
            }
        }
        .environmentObject(router)
    }
}
#Preview {
    ContentView()
}

