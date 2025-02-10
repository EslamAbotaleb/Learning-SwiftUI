//
//  MyRoutes.swift
//  NavigationManagement
//
//  Created by Eslam on 10/02/2025.
//

import SwiftUI
enum RoutesNames: Routable {
    case home
    case profile(userID: UUID)
    case settings

    @ViewBuilder
    var body: some View {
        switch self {
            case .home:
                HomeView()
            case .profile(let userID):
                ProfileView(userID: userID)
            case .settings:
                SettingsView()
        }
    }
}
