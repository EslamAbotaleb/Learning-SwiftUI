//
//  TaskViewModel.swift
//  MVVMSwiftui
//
//  Created by Eslam on 04/02/2025.
//

import Foundation
class TaskViewModel: ObservableObject {
    @Published var isUpdateTask: Bool = false
    @Published var taskToUpdate: Task? // The task being updated

    @Published var tasks: [Task] = [
        Task(title: "Finish SwiftUI tutorial", completed: false),
        Task(title: "Finish UIKit tutorial", completed: true),
        Task(title: "Finish Flutter tutorial", completed: false),
        Task(title: "Finish RxSwift tutorial", completed: true),
        Task(title: "Finish Combine tutorial", completed: false),
    ]
    //MARK: - Add task
    func addTask(title: String)  {
        let newTask = Task(title: title, completed: false)
        tasks.append(newTask)
    }
    //MARK: - Change status task to make task complete || not complete
    func changeStatusTask(task: Task) {
        if let index = tasks.firstIndex(where: {$0.id == task.id}) {
            tasks[index].completed.toggle()
        }
    }
    //MARK: - Delete Task
    // Delete task by UUID
    func deleteTaskById(id: UUID) {
        if let index = tasks.firstIndex(where: { $0.id == id }) {
            tasks.remove(at: index)
        }
    }
    // Delete task by IndexSet
    func deleteTaskByIndexSet(_ indexSet: IndexSet) {
        tasks.remove(atOffsets: indexSet)
    }
    // Set up for task update
    func setUpForTaskUpdate(task: Task) {
        taskToUpdate = task
        isUpdateTask = true
    }
    // Method to reset update mode
    func resetUpdateMode() {
        isUpdateTask = false
        taskToUpdate = nil
    }
    // Update an existing task
    func updateTask(task: Task, newTitle: String) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].title = newTitle
            taskToUpdate = nil
            isUpdateTask = false
        }
    }
}
