//
//  CompositeValidationRule.swift
//  ValidationExample
//
//  Created by Eslam on 02/02/2025.
//

import Foundation

struct CompositeValidationRule<Input>: ValidationRule {
    typealias Input = Input
    private let rules: [AnyValidationRule<Input>]
    init(rules: [AnyValidationRule<Input>]) {
        self.rules = rules
    }

    func validate(_ input: Input) -> String? {
        for rule in rules {
            if let error = rule.validate(input) {
                return error
            }
        }
        return nil
    }
}
