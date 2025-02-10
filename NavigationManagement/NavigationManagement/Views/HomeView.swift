//
//  HomeView.swift
//  NavigationManagement
//
//  Created by Eslam on 10/02/2025.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var router: RouterViewModel<RoutesNames>

    var body: some View {
        VStack {
            Text("HomeView")
            Button("back To Root") {
                router.navigateBack()
            }
        }
    }
}

#Preview {
    HomeView()
}
