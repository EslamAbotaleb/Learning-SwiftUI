//
//  ColorModeModifier.swift
//  NavigationManagement
//
//  Created by Eslam on 11/02/2025.
//

import SwiftUI

struct ColorSchemeViewModifier: ViewModifier {
    @Environment(\.colorScheme) var colorScheme

    var lightBackgroundColor: Color
    var darkBackgroundColor: Color
    var lightForegroundColor: Color
    var darkForegroundColor: Color

    func body(content: Content) -> some View {
        content
            .background(colorScheme == .dark ? darkBackgroundColor : lightBackgroundColor, in: RoundedRectangle(cornerRadius: 8))
            .foregroundStyle(colorScheme == .dark ? darkForegroundColor : lightForegroundColor)
    }
}
