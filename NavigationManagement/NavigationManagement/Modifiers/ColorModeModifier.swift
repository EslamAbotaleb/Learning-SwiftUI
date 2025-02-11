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

#if canImport(AppKit)
import AppKit
#endif

#if canImport(UIKit)
import UIKit
#endif

extension Color {
    init(light: Color, dark: Color) {
        #if canImport(UIKit)
        self.init(light: UIColor(light), dark: UIColor(dark))
        #else
        self.init(light: NSColor(light), dark: NSColor(dark))
        #endif
    }

    #if canImport(UIKit)
    init(light: UIColor, dark: UIColor) {
        #if os(watchOS)
        // watchOS does not support light mode / dark mode
        // Per Apple HIG, prefer dark-style interfaces
        self.init(uiColor: dark)
        #else
        self.init(uiColor: UIColor(dynamicProvider: { traits in
            switch traits.userInterfaceStyle {
            case .light, .unspecified:
                return light

            case .dark:
                return dark

            @unknown default:
                assertionFailure("Unknown userInterfaceStyle: \(traits.userInterfaceStyle)")
                return light
            }
        }))
        #endif
    }
    #endif

    #if canImport(AppKit)
    init(light: NSColor, dark: NSColor) {
        self.init(nsColor: NSColor(name: nil, dynamicProvider: { appearance in
            switch appearance.name {
            case .aqua,
                 .vibrantLight,
                 .accessibilityHighContrastAqua,
                 .accessibilityHighContrastVibrantLight:
                return light

            case .darkAqua,
                 .vibrantDark,
                 .accessibilityHighContrastDarkAqua,
                 .accessibilityHighContrastVibrantDark:
                return dark

            default:
                assertionFailure("Unknown appearance: \(appearance.name)")
                return light
            }
        }))
    }
    #endif
}
