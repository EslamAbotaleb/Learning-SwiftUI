//
//  CRUDTaskView.swift
//  MVVMSwiftui
//
//  Created by Eslam on 04/02/2025.
//

import SwiftUI

struct CRUDTaskView: View {
    @EnvironmentObject var viewModel: CRUDTodoViewModel
    @State private var titleTask: String = ""  // State to hold the new task title
    @Environment(\.dismiss) var dismissPage
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Enter task title", text:$titleTask)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                if viewModel.isUpdateTask,
                   let task = viewModel.taskToUpdate {
                    HStack {
                        Button("Update Task") {
                            viewModel.updateTask(task: task, newTitle: titleTask)
                            dismissPage()
                        }
                        .padding()
                        .buttonStyle(PrimaryButtonStyle(changeValueText: titleTask == "" ? true : false))
                        Button("Delete Task") {
                            viewModel.deleteTaskById(id: task.id)
                            dismissPage()
                        }
                        .buttonStyle(PrimaryButtonStyle(changeValueText: true))
                    }
                } else {
                    Button("Add Task") {
                        if !titleTask.isEmpty {
                            viewModel.addTask(title: titleTask)
                            titleTask = ""
                            dismissPage()
                        }
                    }
                    .padding()
                    .buttonStyle(PrimaryButtonStyle(changeValueText: titleTask == "" ? true : false))
                }
                Spacer()
            }
            .onAppear {
                if viewModel.isUpdateTask {
                    titleTask = viewModel.taskToUpdate?.title ?? ""
                }
            }
            .navigationTitle(viewModel.isUpdateTask ? "Update Task" : "Add Task")
        }
    }
}

//#Preview {
//    CRUDTaskView()
//        .environmentObject(TaskViewModel())
//}
