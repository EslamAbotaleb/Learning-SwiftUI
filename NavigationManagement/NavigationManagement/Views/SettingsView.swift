//
//  SettingsView.swift
//  NavigationManagement
//
//  Created by Eslam on 10/02/2025.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var router: RouterViewModel<RoutesNames>

    var body: some View {
        VStack {
            Text("SettingsView")
            Button("back To Root") {
                router.navigateBack()
            }
        }
    }
}

