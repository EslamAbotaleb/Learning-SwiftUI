//
//  TodoService.swift
//  MVVMSwiftui
//
//  Created by Eslam on 05/02/2025.
//

import Foundation

class TodoService:ObservableObject, TodoServiceProtocol {

    private var tasks: [Task] = [
        Task(title: "Finish SwiftUI tutorial", completed: false),
        Task(title: "Finish UIKit tutorial", completed: true),
        Task(title: "Finish Flutter tutorial", completed: false),
        Task(title: "Finish RxSwift tutorial", completed: true),
        Task(title: "Finish Combine tutorial", completed: false)
    ]

    func getAllTasks() -> [Task] {
        return tasks
    }
    func addTask(_ task: Task) {
        tasks.append(task)
    }
    func reloadTasks() {

    }
    func deleteTaskById(id: UUID) {
        if let index = tasks.firstIndex(where: { $0.id == id }) {
            tasks.remove(at: index)
        }
    }
    func updateTask(task: Task, newTitle: String) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].title = newTitle
        }
    }
}
