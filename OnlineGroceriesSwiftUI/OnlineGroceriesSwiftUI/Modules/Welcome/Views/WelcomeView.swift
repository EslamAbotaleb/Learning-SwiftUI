//
//  WelcomeView.swift
//  OnlineGroceriesSwiftUI
//
//  Created by Eslam on 11/02/2025.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack {
            Image(.welcomBg)
                .resizable()
                .scaledToFill()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    WelcomeView()
}
