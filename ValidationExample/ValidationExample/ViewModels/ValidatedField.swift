//
//  ValidatedField.swift
//  ValidationExample
//
//  Created by Eslam on 02/02/2025.
//

import Combine
import Foundation

class ValidatedField: ObservableObject {
    @Published var value: String = ""
    @Published var error: String? = nil

    private var cancellable = Set<AnyCancellable>()
    private var validationRules: [AnyValidationRule<String>]

    init(validationRules: [AnyValidationRule<String>]) {
        self.validationRules = validationRules
        setupValidation()
    }
    func setupValidation(){
        $value
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .removeDuplicates()
            .map {
                [weak self] in
                self?.validate($0)
            }
            .assign(to: \.error, on: self)
            .store(in: &cancellable)
    }
    private func validate(_ value: String) -> String? {
        for rule in validationRules {
            if let error = rule.validate(value) {
                return error
            }
        }
        return nil
    }
}
