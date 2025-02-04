//
//  EmptyValidationRule.swift
//  ValidationExample
//
//  Created by Eslam on 02/02/2025.
//

import Foundation

struct EmptyValidationRule: ValidationRule {
    typealias Input = String
    let errorMessage: String
    init(errorMessage: String = "This field cannot be empty.") {
        self.errorMessage = errorMessage
    }
    func validate(_ input: String) -> String? {
        return input.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? errorMessage : nil
    }
}
