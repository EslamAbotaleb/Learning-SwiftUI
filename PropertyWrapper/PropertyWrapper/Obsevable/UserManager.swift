//
//  UserManager.swift
//  PropertyWrapper
//
//  Created by Eslam on 01/02/2025.
//

import Foundation

class UserManager: ObservableObject {
    @Published var tasks: [Task] = [
        Task(title: "Buy groceries", completed: true),
        Task(title: "Walk the dog", completed: false)
    ]

    func addTask(title: String) {
        let newTask = Task(title: title, completed: false)
        tasks.append(newTask)
    }
    func toggleTask(task: Task) {
        if let index = tasks.firstIndex(where: {$0.id == task.id}) {
            tasks[index].completed.toggle()
        }
    }
}
