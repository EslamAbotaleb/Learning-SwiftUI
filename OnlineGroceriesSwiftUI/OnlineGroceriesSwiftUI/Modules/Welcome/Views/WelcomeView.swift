//
//  WelcomeView.swift
//  OnlineGroceriesSwiftUI
//
//  Created by Eslam on 11/02/2025.
//

import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var router: RouterViewModel<RoutesNames>
    var body: some View {
        ZStack {
            Image(.welcomBg)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            VStack {
                Spacer()
                Image(.appLogo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .padding(.bottom, 8)
                Text("Welcome\nto our store")
                    .font(.customfont(.semibold, fontSize: 48))
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)

                Text( "Ger your groceries in as fast as one hour")
                    .font(.customfont(.regular, fontSize: 16))
                    .foregroundStyle(.white.opacity(0.7))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 30)
                Text("Get Started")
                    .roundViewWithAction(backgroundColor: .primaryApp, minHeight: 60, maxHeight: 60) {
                        router.navigate(to: .signIn)
                    }
                Spacer()
                    .frame(height: 80)
            }
            .padding(.horizontal, 20)
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        .toolbar(.hidden)
    }
}

#Preview {
    WelcomeView()
}
