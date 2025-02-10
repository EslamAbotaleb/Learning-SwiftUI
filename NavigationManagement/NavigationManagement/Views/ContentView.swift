//
//  ContentView.swift
//  NavigationManagement
//
//  Created by Eslam on 10/02/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var router: RouterViewModel<RoutesNames> = .init()
    var body: some View {
        /*
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
         */
        RoutingView(stack: $router.stack, root: {
            CategoryView()
        }, navigationTitle: "Catégories")
        .environmentObject(router)
    }
}
#Preview {
    ContentView()
}

