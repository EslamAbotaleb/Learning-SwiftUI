//
//  TaskListViewModel.swift
//  MVVMSwiftui
//
//  Created by Eslam on 04/02/2025.
//

import Foundation
class TaskListViewModel: ObservableObject {
    @Published var isUpdateTask: Bool = false
    @Published var taskToUpdate: Task? // The task being updated
    @Published var tasks: [Task] = []  // List of tasks
    private var taskService: TodoServiceProtocol

    // Inject Todo task service
    init(taskService: TodoServiceProtocol) {
        self.taskService = taskService
        loadTasks()
    }

    // Change task completion status
    func changeStatusTask(task: Task) {
        if let index = tasks.firstIndex(where: {$0.id == task.id}) {
            tasks[index].completed.toggle()
        }
    }

    // Load all tasks
    func loadTasks() {
        tasks = taskService.getAllTasks()
    }

    // Reload tasks (for after add/update/delete)
    func reloadTasks() {
        loadTasks()  // Re-fetch tasks from the service
    }

    // Navigate to Add Task view or Update Task view
    func navigateToAddTaskView(isUpdate: Bool, task: Task? = nil) -> CRUDTodoViewModel {
        let viewModel = CRUDTodoViewModel(taskService: taskService)
        viewModel.isUpdateTask = isUpdate
        viewModel.taskToUpdate = task
        viewModel.onTaskUpdated = {
            // This is called when a task is added, updated, or deleted
            self.reloadTasks()
        }
        return viewModel
    }

    // Set up task for update
    func setUpForTaskUpdate(task: Task) {
        taskToUpdate = task
        isUpdateTask = true
    }

    // Reset update mode
    func resetUpdateMode() {
        isUpdateTask = false
        taskToUpdate = nil
    }
}
