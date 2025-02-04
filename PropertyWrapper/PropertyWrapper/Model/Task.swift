//
//  Task.swift
//  PropertyWrapper
//
//  Created by Eslam on 01/02/2025.
//

import Foundation
import SwiftUI

struct Task: Identifiable {
    var id = UUID()
    var title: String
    var completed: Bool
}

struct TaskKey: EnvironmentKey {
    static var defaultValue: Task? = nil
}

extension EnvironmentValues {
    var task: Task? {
        get { self[TaskKey.self] }
        set { self[TaskKey.self] = newValue }
    }
}
