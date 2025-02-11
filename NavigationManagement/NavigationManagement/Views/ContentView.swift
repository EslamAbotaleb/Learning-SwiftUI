//
//  ContentView.swift
//  NavigationManagement
//
//  Created by Eslam on 10/02/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var router: RouterViewModel<RoutesNames> = .init()
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        RoutingView(stack: $router.stack, root: {
            CategoryView()
        }, navigationTitle: "Categories")
        .environmentObject(router)
        /*
         .modifier(ColorSchemeViewModifier(
         lightBackgroundColor: Color.white,
         darkBackgroundColor: Color.black,
         lightForegroundColor: .black,
         darkForegroundColor: .white
         ))
         */
    }
}
#Preview {
    ContentView()
}

