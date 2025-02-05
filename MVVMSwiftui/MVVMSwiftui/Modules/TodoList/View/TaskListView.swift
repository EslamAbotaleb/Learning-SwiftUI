//
//  TaskListView.swift
//  MVVMSwiftui
//
//  Created by Eslam on 04/02/2025.
//

import SwiftUI

struct TaskListView: View {
    @EnvironmentObject var viewModel: TaskListViewModel
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(alignment: .leading) {
                    ForEach(viewModel.tasks) {
                        task in
                        NavigationLink(destination: CRUDTaskView().environmentObject(viewModel.navigateToAddTaskView(isUpdate: true, task: task))) {
                            TaskRow()
                                .environment(\.task, task)
                        }
                        .simultaneousGesture(TapGesture().onEnded {
                            // When a task is tapped, set up the view for editing
                            viewModel.setUpForTaskUpdate(task: task)
                        })
                    }
                }
                .padding()
            }
            .navigationTitle("Tasks")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: CRUDTaskView().environmentObject(viewModel.navigateToAddTaskView(isUpdate: false))) {
                        Image(systemName: "plus")
                            .font(.title)
                    }
                    .simultaneousGesture(TapGesture().onEnded {
                        // When a task is tapped, set up the view for add
                        viewModel.resetUpdateMode()
                    })
                }
            }
        }
    }
}

//#Preview {
//    TaskListView()
//        .environmentObject(TaskViewModel())
//}
