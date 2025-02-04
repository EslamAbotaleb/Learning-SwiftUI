//
//  ValidatedFieldModifier.swift
//  ValidationExample
//
//  Created by Eslam on 02/02/2025.
//

import SwiftUI
/// A view modifier that attaches validation to a TextField.
struct ValidatedFieldModifier: ViewModifier {
    @ObservedObject var validationField: ValidatedField
    let placeholder: String

    func body(content: Content) -> some View {
        VStack(alignment: .leading, spacing: 5) {
            content
                .padding()
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(validationField.error == nil ? .green : .red)

                    if let error = validationField.error {
                        Text(error)
                            .foregroundStyle(.red)
                            .font(.caption)
                }
            }
        }
    }
}
extension View {
    func validatedField(validationField: ValidatedField, placeholder: String) -> some View {
        self.modifier(ValidatedFieldModifier(validationField: validationField, placeholder: placeholder))
    }
}
