//
//  CustomEnviroment.swift
//  PropertyWrapper
//
//  Created by Eslam on 01/02/2025.
//

import SwiftUI

//MARK: - Define EnvironmentKey
struct CurrentUserKey: EnvironmentKey {
    static let defaultValue: String = "Guest"
}

//MARK: - Define extension for environmentValues
extension EnvironmentValues {
    var currentUser: String {
        get { self[CurrentUserKey.self] }
        set { self[CurrentUserKey.self] = newValue }
    }
}
