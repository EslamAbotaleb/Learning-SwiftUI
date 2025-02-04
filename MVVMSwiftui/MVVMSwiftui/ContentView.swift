//
//  ContentView.swift
//  MVVMSwiftui
//
//  Created by Eslam on 04/02/2025.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: TaskViewModel
    var body: some View {
        TaskListView()
        .environment(\.task, viewModel.tasks.first)
    }
}

#Preview {
    ContentView()
        .environmentObject(TaskViewModel())

}
