//
//  UpperCased.swift
//  PropertyWrapper
//
//  Created by Eslam on 02/02/2025.
//

import SwiftUI
//DynamicProperty
@propertyWrapper
struct UpperCased: DynamicProperty {
    @State var wrappedValue: String

    var projectedValue: Binding<String> {
        Binding(
            get: {
                wrappedValue.uppercased()
            },
            set: {
                wrappedValue = $0.uppercased()
            }
        )
    }
}
