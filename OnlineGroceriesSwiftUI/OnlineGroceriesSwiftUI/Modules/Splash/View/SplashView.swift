//
//  SplashView.swift
//  OnlineGroceriesSwiftUI
//
//  Created by Eslam on 11/02/2025.
//

import SwiftUI

struct SplashView: View {
    @StateObject var splashViewModel: SplashViewModel = SplashViewModel(isActive: false)
    @StateObject private var router: RouterViewModel<RoutesNames> = .init()
    var body: some View {
        ZStack {
            if splashViewModel.isActive {
                RoutingView(stack: $router.stack, root: {
                    WelcomeView()
                }, navigationTitle: "")

            } else {
                Image(.splash)
                    .resizable()
                    .ignoresSafeArea()
            }
        }
        .onAppear {
            Task {
                await splashViewModel.setTimeForSplash()
                withAnimation {
                    splashViewModel.isActive = true
                }
            }
        }
        .environmentObject(router)
    }
}
