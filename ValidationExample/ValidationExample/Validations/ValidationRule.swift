//
//  ValidationRule.swift
//  ValidationExample
//
//  Created by Eslam on 02/02/2025.
//

import Foundation
protocol ValidationRule {
    associatedtype Input

    /// Validates the given input.
    /// - Parameter input: The input to validate.
    /// - Returns: An optional error message if validation fails.
    func validate(_ input: Input) -> String?
}
