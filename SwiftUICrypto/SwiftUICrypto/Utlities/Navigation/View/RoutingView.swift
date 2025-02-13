//
//  RoutingView.swift
//  NavigationManagement
//
//  Created by Eslam on 10/02/2025.
//

import SwiftUI

struct RoutingView<Root: View, Routes: Routable>: View {

    @Binding private var routes: [Routes]

    private let root: () -> Root
    var navigationTitle:  String
    var navigationBarHidden: Bool
    //where Routes: Routable
    public init(stack: Binding<[Routes]>,
                @ViewBuilder root: @escaping () -> Root,
                navigationBarHidden: Bool = false,
                navigationTitle: String) {
        self._routes = stack
        self.root = root
        self.navigationBarHidden = navigationBarHidden
        self.navigationTitle = navigationTitle
    }
    var body: some View {
        NavigationStack(path: $routes) {
            root()
                .navigationTitle(navigationTitle)  // Dynamically set title or empty
                .navigationBarHidden(navigationBarHidden)  // Dynamically hide/show navigation bar
                .navigationDestination(for: Routes.self) { view in
                    view
                }
        }
    }
}
