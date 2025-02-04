//
//  AddTaskView.swift
//  PropertyWrapper
//
//  Created by Eslam on 01/02/2025.
//

import SwiftUI

struct AddTaskView: View {
    @EnvironmentObject var userManager: UserManager
    @State private var newTaskTitle: String = ""  // State to hold the new task title

    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter task title", text: $newTaskTitle)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button("Add Task") {
                    if !newTaskTitle.isEmpty {
                        userManager.addTask(title: newTaskTitle)
                        newTaskTitle = ""
                    }
                }
                .padding()
                .buttonStyle(BorderedButtonStyle())
                Spacer()
            }
            .navigationTitle("Add Task")
        }
    }
}

#Preview {
    AddTaskView()
        .environmentObject(UserManager())
}
