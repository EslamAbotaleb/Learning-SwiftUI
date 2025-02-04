//
//  ClampedWrapper.swift
//  PropertyWrapper
//
//  Created by Eslam on 02/02/2025.
//

import Foundation
@propertyWrapper
struct Clamped<Value: Comparable> {
    private var value: Value
    private let range: ClosedRange<Value>

    var wrappedValue: Value {
        get { value }
        set { value = min(max(newValue, range.lowerBound), range.upperBound) }
    }

    init(wrappedValue: Value, _ range: ClosedRange<Value>) {
        self.range = range
        self.value = min(max(wrappedValue, range.lowerBound), range.upperBound)
    }
}
/*
struct Clamped<Value: Comparable> {
    private var value: Value
    private let range: ClosedRange<Value>

    //MARK: - Define WrapperValue
    var wrappedValue: Value {
        get { value }
        set {
            if range.contains(newValue) {
                value = newValue
            } else {
                print("Value \(newValue) is out of range. Clamping to range \(range).")
                value = newValue < range.lowerBound ? range.lowerBound : range.upperBound
            }
        }
    }

    init(wrappedValue: Value,_ range: ClosedRange<Value>) {
        self.value = min(max(wrappedValue, range.lowerBound), range.upperBound)
        self.range = range
    }
}
 */

/*
 struct User {
     @Clamped(0...100) var age: Int
 }

 var user = User(age: 150)
 print(user.age)
 */
