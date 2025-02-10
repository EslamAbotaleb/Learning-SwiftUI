//
//  ProfileView.swift
//  NavigationManagement
//
//  Created by Eslam on 10/02/2025.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var router: RouterViewModel<RoutesNames>
    let userID: UUID

    var body: some View {
        VStack {
            Text("ProfileView")
            Button("back To Root") {
                router.navigateBack()
            }
        }
    }
}

#Preview {
    ProfileView(userID: UUID())
}
