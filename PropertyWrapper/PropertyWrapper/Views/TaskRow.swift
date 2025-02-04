//
//  TaskRow.swift
//  PropertyWrapper
//
//  Created by Eslam on 01/02/2025.
//

import SwiftUI

struct TaskRow: View {
    @Environment(\.task) var task: Task?  // Access the custom task from the environment
    @EnvironmentObject var userManager: UserManager  // Access UserManager to toggle task completion

    var body: some View {
        HStack {
            if let task = task {
                Text(task.title)
                Spacer()
                Button {
                    userManager.toggleTask(task: task)
                } label: {
                    Image(systemName:  task.completed ? "checkmark.circle.fill" : "circle")
                        .foregroundStyle(task.completed ? .green : .gray)
                }
            } else {
                Text("No task available")
            }
        }
        .padding(8)
    }
}
