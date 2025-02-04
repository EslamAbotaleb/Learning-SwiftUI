//
//  LoginViewModel.swift
//  ValidationExample
//
//  Created by Eslam on 02/02/2025.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    @Published var email: ValidatedField
    @Published var password: ValidatedField
    @Published var canSubmit: Bool = false

    private var cancellable = Set<AnyCancellable>()

    init() {
        //errorMessage: "Email cannot be empty"
        let emailRules: [AnyValidationRule<String>] = [
            AnyValidationRule(EmptyValidationRule()),
            AnyValidationRule(EmailValidationRule())
        ]

        let passwordRules: [AnyValidationRule<String>] = [
            AnyValidationRule(EmptyValidationRule(errorMessage: "Password cannot be empty.")),
            AnyValidationRule(SpecialCharacterValidationRule())
        ]

        self.email = ValidatedField(validationRules: emailRules)
        self.password = ValidatedField(validationRules: passwordRules)

        setupSubmitValidation()
    }
    private func setupSubmitValidation() {
        Publishers.CombineLatest(email.$error, password.$error)
            .map {
                emailError, passwordError in
                return emailError == nil && passwordError == nil
                && !self.email.value.isEmpty && !self.password.value.isEmpty
            }
            .assign(to: \.canSubmit, on: self)
            .store(in: &cancellable)
    }
    /// Handles the login action.
    func login() {
        // Implement login logic here.
        print("Logging in with Email: \(email.value) and Password: \(password.value)")
    }
}
