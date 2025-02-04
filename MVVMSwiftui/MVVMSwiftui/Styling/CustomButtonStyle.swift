//
//  CustomButtonStyle.swift
//  MVVMSwiftui
//
//  Created by Eslam on 04/02/2025.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    var changeValueText: Bool
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .font(.title2)
            .padding(.horizontal, 30)
            .padding(.vertical, 8)
            .foregroundStyle(
                changeValueText == false
                ? .mint
                : .pink)
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(changeValueText == false
                            ? .mint
                            : .pink, lineWidth: 1.5)
            }
    }
}
