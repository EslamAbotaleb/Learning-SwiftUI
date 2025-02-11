//
//  SplashView.swift
//  OnlineGroceriesSwiftUI
//
//  Created by Eslam on 11/02/2025.
//

import SwiftUI

struct SplashView: View {
    @StateObject var splashViewModel: SplashViewModel = SplashViewModel(isActive: false)
    var body: some View {
        ZStack {
            if splashViewModel.isActive {
                WelcomeView()
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
    }
}
