//
//  Theme.swift
//  NavigationManagement
//
//  Created by Eslam on 11/02/2025.
//

import SwiftUI

struct Theme {
    var button: Button
    struct Button {
        var primary: Primary
        var secondary: Secondary
        var tertiary: Tertiary

        struct Primary {
            var color: Color
            var borderWidth: CGFloat
        }
        struct Secondary {
            var color: Color
        }
        struct Tertiary {
            var color: Color
        }
    }
}
extension Theme {
    static let `default` = Self(
        button: .init(
            primary: .init(color: Color(light: .teal, dark: .blue), borderWidth: 1),
            secondary: .init(color: Color(light: .teal.opacity(0.6), dark: .blue.opacity(0.6))),
            tertiary: .init(color: Color(light: .tertiarySystemBackground, dark: .tertiarySystemBackground)))
    )
}
private struct ThemeEnvironmentKey: EnvironmentKey {
    static var defaultValue = Theme.default
}
extension EnvironmentValues {
    var theme: Theme {
        get {
            self[ThemeEnvironmentKey.self]
        }
        set {
            self[ThemeEnvironmentKey.self] = newValue
        }
    }
}
