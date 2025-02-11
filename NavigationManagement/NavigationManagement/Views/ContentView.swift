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
        RoutingView(stack: $router.stack, root: {
            CategoryView()
        }, navigationTitle: "Categories")
        .environmentObject(router)
    }
}
#Preview {
    ContentView()
}

