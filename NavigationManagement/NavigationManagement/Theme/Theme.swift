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
        struct Primary {
            var color: Color
        }
    }
}

extension Theme {
    static let `default` = Self(
        button: .init(
            primary: .init(color: Color(light: .teal, dark: .blue)))
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
