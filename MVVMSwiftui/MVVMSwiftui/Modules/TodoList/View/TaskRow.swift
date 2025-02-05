//
//  TaskRow.swift
//  MVVMSwiftui
//
//  Created by Eslam on 04/02/2025.
//

import SwiftUI


struct TaskRow: View {
    @Environment(\.task) var task: Task? // Access the custom task from the environment
    @EnvironmentObject var viewModel: TaskListViewModel

    var body: some View {
        HStack {
            if let task = task {
                VStack(alignment: .leading) {
                    HStack {
                        Text(task.title)
                            .font(.headline)
                            .foregroundStyle(task.completed ? .gray : .primary)
                            .frame(maxWidth: .infinity)
                        Button {
                            // Action to change task status using ViewModel
                            viewModel.changeStatusTask(task: task)
                        } label: {
                            Image(systemName: task.completed ? "checkmark.circle.fill" : "circle")
                                .foregroundStyle(task.completed ? .green : .gray)
                                .font(.title)
                        }
                    }
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.white)
                        .shadow(radius: 5)
                )
                .padding(.horizontal)
                .frame(maxWidth: .infinity)
            }
        }
        .padding(.vertical)
    }
}

//
//#Preview {
//    TaskRow()
//}
