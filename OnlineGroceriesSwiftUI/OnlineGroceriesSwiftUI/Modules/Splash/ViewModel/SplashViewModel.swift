//
//  SplashViewModel.swift
//  OnlineGroceriesSwiftUI
//
//  Created by Eslam on 11/02/2025.
//

import Foundation

@MainActor
class SplashViewModel: ObservableObject {
    @Published var isActive: Bool

    init(isActive: Bool) {
        self.isActive = isActive
    }
    func setTimeForSplash() async {
        try? await Task.sleep(nanoseconds: 2_500_000_000)
        self.isActive = false
    }
}
