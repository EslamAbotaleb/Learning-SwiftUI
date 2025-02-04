//
//  WrapperName.swift
//  PropertyWrapper
//
//  Created by Eslam on 02/02/2025.
//

import Foundation

@propertyWrapper
struct WrapperName<ValueType> {
    private var value: ValueType
    //MARK: - Encapsulates the actual data
    var wrappedValue: ValueType {
        get { return value }
        set { value = newValue }
    }
    init(value: ValueType) {
        self.value = value
    }
}

struct Example {
    @WrapperName var property: Int
}
