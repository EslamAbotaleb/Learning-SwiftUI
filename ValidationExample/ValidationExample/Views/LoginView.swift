//
//  LoginView.swift
//  ValidationExample
//
//  Created by Eslam on 02/02/2025.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    var body: some View {
        VStack(spacing: 20) {
            TextField("Email", text: $viewModel.email.value)
                .validatedField(validationField: viewModel.email, placeholder: "Email")
                .keyboardType(.emailAddress)
                .textInputAutocapitalization(.none)
            // Password Field
            SecureField("Password", text: $viewModel.password.value)
                .validatedField(validationField: viewModel.password, placeholder: "Password")

            // Login Button
            Button(action: {
                viewModel.login()
            }) {
                Text("Login")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(viewModel.canSubmit ? Color.blue : Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .disabled(!viewModel.canSubmit)
        }
        .padding(16)
    }
}

#Preview {
    LoginView()
}
