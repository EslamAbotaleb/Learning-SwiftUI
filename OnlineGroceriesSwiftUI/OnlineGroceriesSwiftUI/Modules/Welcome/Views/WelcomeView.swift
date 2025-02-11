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
                NavigationLink(destination: SignInView()) {
                    Text("Get Started")
                        .roundViewWithAction(minHeight: 60, maxHeight: 60)
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
