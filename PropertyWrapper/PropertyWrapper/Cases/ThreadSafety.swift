//
//  ThreadSafety.swift
//  PropertyWrapper
//
//  Created by Eslam on 02/02/2025.
//

import Foundation
@propertyWrapper
class Synchronized<Value> {
    private var value: Value
    private let queue = DispatchQueue(label: "synchronized.queue")

    var wrappedValue: Value {
        get {
            queue.sync {
                value
            }
        }
        set {
            queue.sync {
                value = newValue
            }
        }
    }
    init(value: Value) {
        self.value = value
    }
}
