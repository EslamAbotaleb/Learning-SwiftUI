//
//  CRUDTodoViewModel.swift
//  MVVMSwiftui
//
//  Created by Eslam on 05/02/2025.
//

import Foundation
class CRUDTodoViewModel: ObservableObject {
    @Published var isUpdateTask: Bool = false
    @Published var taskToUpdate: Task? // The task being updated
    @Published var taskTitle: String = ""
    @Published var tasks: [Task] = []
    private var taskService: TodoServiceProtocol
    var onTaskUpdated: (() -> Void)? // Callback to notify about task updates

    init(taskService: TodoServiceProtocol) {
        self.taskService = taskService
    }

    // Add task
    func addTask(title: String) {
        let newTask = Task(title: title, completed: false)
        taskService.addTask(newTask)
        onTaskUpdated?() // Notify about the task update
    }
    
    // Delete task
    func deleteTaskById(id: UUID) {
        taskService.deleteTaskById(id: id)
        onTaskUpdated?() // Notify about the task update
    }

    // Update task
    func updateTask(task: Task, newTitle: String) {
        taskService.updateTask(task: task, newTitle: newTitle)
        onTaskUpdated?() // Notify about the task update
    }
}
