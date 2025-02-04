///Users/eslam/Documents/xcode Projects/PropertyWrapper/PropertyWrapper
//  ContentView.swift
//  PropertyWrapper
//
//  Created by Eslam on 31/01/2025.
//

import SwiftUI

struct ContentView: View {
    @UpperCased var name = ""
    @EnvironmentObject var userManager: UserManager  // Access UserManager
    @State private var text = ""
//    @ObservedObject var userData = UserData()
//    @StateObject var useData = UserData()
//    @State private var selectedColor = Color.red
//    @StateObject var employee = Company()
    var body: some View {
            TaskListView()
            .environment(\.task, userManager.tasks.first)

    }
}
#Preview {
    ContentView()
        .environmentObject(UserManager())
}
