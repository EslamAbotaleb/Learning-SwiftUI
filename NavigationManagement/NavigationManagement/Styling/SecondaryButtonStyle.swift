//
//  SecondaryButtonStyle.swift
//  NavigationManagement
//
//  Created by Eslam on 11/02/2025.
//

import SwiftUI
struct SecondaryButtonStyle: ButtonStyle {
    @Environment(\.theme.button.secondary) private var theme
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .font(.system(.caption2, design: .rounded).bold())
        .padding([.vertical], 24)
        .foregroundStyle(self.theme.color)
        .background {
            Capsule()
                .stroke(self.theme.color, lineWidth: 3)
        }
    }
}

extension ButtonStyle where Self == SecondaryButtonStyle {
    static var secondary: Self { .init() }
}
