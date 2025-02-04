//
//  EmailValidationRule.swift
//  ValidationExample
//
//  Created by Eslam on 02/02/2025.
//

import Foundation
struct EmailValidationRule: ValidationRule {
    typealias Input = String
    let errorMessage: String

    init(errorMessage: String = "Please enter a valid email address.") {
        self.errorMessage = errorMessage
    }

    func validate(_ input: String) -> String? {
//        let emailRegex = #"^\S+@\S+\.\S+$"#
        let emailRegex = #"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"#
        let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return predicate.evaluate(with: input) ? nil : errorMessage
    }
}
