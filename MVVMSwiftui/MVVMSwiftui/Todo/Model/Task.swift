//
//  Task.swift
//  MVVMSwiftui
//
//  Created by Eslam on 04/02/2025.
//

import SwiftUI

struct Task: Identifiable {
    var id = UUID()
    var title: String
    var completed: Bool
}
//MARK: - This custom environment makes it easier to pass objects without explicitly passing them through each view which happened between (StateObject & ObservedObject)
struct TaskKey: EnvironmentKey {
    static var defaultValue: Task? = nil
}

extension EnvironmentValues {
    var task: Task? {
        get { self[TaskKey.self] }
        set { self[TaskKey.self] = newValue }
    }
}
