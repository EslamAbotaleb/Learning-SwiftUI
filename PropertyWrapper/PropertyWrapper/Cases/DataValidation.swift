//
//  DataValidation.swift
//  PropertyWrapper
//
//  Created by Eslam on 02/02/2025.
//

import Foundation

@propertyWrapper
struct PositiveInt {
    private var value: Int

    var wrappedValue: Int {
        get {value}
        set {
            if value > 0 {
                value = newValue
            } else {
                print("Invalid value: must be positive.")
                value = 0
            }
        }
    }

    init(value: Int) {
        self.value = value < 0 ? 0 : value
    }
}
