//
//  PrimaryButtonStyle.swift
//  NavigationManagement
//
//  Created by Eslam on 11/02/2025.
//

import SwiftUI
struct PrimaryButtonStyle: ButtonStyle {
    @Environment(\.theme.button.primary) private var theme
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .font(.system(.title2, design: .monospaced).bold())
        .padding([.vertical], 24)
        .foregroundStyle(self.theme.color)
        //        .foregroundStyle(Color(light: .teal, dark: .white))
        .background {
            Capsule()
            //                .stroke(Color(light: .teal, dark: .blue), lineWidth: 3)
                .stroke(self.theme.color, lineWidth: 3)
        }
    }
}

extension ButtonStyle where Self == PrimaryButtonStyle {
    static var primary: Self { .init() }
}
