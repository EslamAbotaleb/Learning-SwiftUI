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

    public init(stack: Binding<[Routes]>,
                @ViewBuilder root: @escaping () -> Root) where Routes: Routable {
        self._routes = stack
        self.root = root
    }
    var body: some View {
        NavigationStack(path: $routes) {
            root()
                .navigationTitle("Navigation")
                .navigationDestination(for: Routes.self) { view in
                    view
                        .navigationBarBackButtonHidden(true)
                }
        }
    }
}
