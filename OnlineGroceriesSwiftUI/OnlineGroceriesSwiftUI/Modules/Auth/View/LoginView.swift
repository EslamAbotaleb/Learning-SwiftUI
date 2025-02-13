//
//  LoginView.swift
//  OnlineGroceriesSwiftUI
//
//  Created by Eslam on 12/02/2025.
//

import SwiftUI

struct LoginView: View {

    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var viewModel = AuthViewModel()

    var body: some View {
        ZStack {
            Image(.bottomBg)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .screenWidth, maxHeight: .screenHeight)

            VStack {
                Image(.colorLogo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40)
                    .padding(.bottom, .screenWidth * 0.1)


                Text("Logging")
                    .font(.customfont(.semibold, fontSize: 26))
                    .foregroundStyle(Color.primaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 4)

                Text("Enter your emails and password")
                    .font(.customfont(.semibold, fontSize: 16))
                    .foregroundStyle(Color.secondaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, .screenWidth * 0.08)

                LineTextFieldView(placeholder: "Enter your email",title: "Email", keyboardType: .emailAddress, isPassword: .constant(false), text: $viewModel.txtEmail)
                    .padding(.bottom, .screenWidth * 0.02)

                LineTextFieldView(placeholder: "Enter your password", title: "Password", isPassword: $viewModel.isShowPassword, text: $viewModel.txtPassword)
                    .modifier(ShowButtonModifier(isShow: $viewModel.isShowPassword))
                    .padding(.bottom, .screenWidth * 0.02)

                Button {

                } label: {
                    Text("Forget Password?")
                        .font(.customfont(.regular, fontSize: 14))
                        .foregroundStyle(Color.primaryText)
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                .padding(.bottom, .screenWidth * 0.02)

                Text("Log In")
                    .roundViewWithAction(backgroundColor: .primaryApp, minHeight: 60, maxHeight: 60) {
                    }
                    .padding(.bottom, .screenWidth * 0.05)
                HStack {
                    Text("Don't have an account?")
                        .font(.customfont(.bold, fontSize: 14))
                        .foregroundStyle(Color.primaryText)

                    Text("Signup")
                        .font(.customfont(.bold, fontSize: 14))
                        .foregroundStyle(Color.primaryApp)
                }
                Spacer()
            }
            .padding(.top, .topInsets + 64)
            .padding(.horizontal, 20)
            .padding(.bottom, .bottomInsets)

            VStack {
                HStack {
                    Button {
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image(.back)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }
                    Spacer()
                }
                Spacer()
            }
            .padding(.top, .topInsets)
            .padding(.horizontal, 20)
        }
        .background(Color.white)
        .navigationBarBackButtonHidden(true)
        .toolbar(.hidden)
        .ignoresSafeArea()
    }
}

#Preview {
    LoginView()
}
