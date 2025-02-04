//
//  UserDefaults.swift
//  PropertyWrapper
//
//  Created by Eslam on 02/02/2025.
//

import Foundation
@propertyWrapper
struct UserDefault<T> {
    private let key: String
    private let defaultValue: T

    //MARK: - Mandatory to call this wrappedValue
    var wrappedValue: T {
        get {
            UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }

    //MARK: - init
    init(key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
}

struct Settings {
    @UserDefault(key: "userName", defaultValue: "") var userName: String
}
