//
//  TodoProtocol.swift
//  MVVMSwiftui
//
//  Created by Eslam on 05/02/2025.
//

import Foundation
protocol TodoServiceProtocol {
    func getAllTasks() -> [Task]
    func addTask(_ task: Task)
    func deleteTaskById(id: UUID)
    func updateTask(task: Task, newTitle: String)
    func reloadTasks()
}
