//
//  TaskListView.swift
//  PropertyWrapper
//
//  Created by Eslam on 01/02/2025.
//

import SwiftUI

struct TaskListView: View {
    @EnvironmentObject var userManager: UserManager
    var body: some View {
        NavigationView {
            List(userManager.tasks) {
                task in
                TaskRow()
                    .environment(\.task, task)
            }
            .navigationTitle("Tasks")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: AddTaskView()) {
                        Image(systemName: "plus")
                            .font(.title)
                    }
                }
            }
        }
    }
}

#Preview {
    TaskListView()
        .environmentObject(UserManager())
}
