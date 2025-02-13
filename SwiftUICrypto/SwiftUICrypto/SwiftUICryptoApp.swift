//
//  SwiftUICryptoApp.swift
//  SwiftUICrypto
//
//  Created by Eslam on 12/02/2025.
//

import SwiftUI

@main
struct SwiftUICryptoApp: App {
    @StateObject private var router: RouterViewModel<RoutesNames> = .init()
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            RoutingView(stack: $router.stack, root: {
                HomeView()
                    .environmentObject(router)
            }, navigationTitle: "")
            .environmentObject(vm)
        }
    }
}
