//
//  ContentView.swift
//  MVVMSwiftui
//
//  Created by Eslam on 04/02/2025.
//

import SwiftUI

struct ContentView: View {
//    @EnvironmentObject var viewModel: TaskListViewModel
    @EnvironmentObject var viewModel: TodoService
    var body: some View {
        TaskListView()
            .environmentObject(TaskListViewModel(taskService: viewModel))
//        .environment(\.task, viewModel.tasks.first)
    }
}

//#Preview {
//    ContentView()
//        .environmentObject(TaskListViewModel(taskService: TodoService()))
//
//}
