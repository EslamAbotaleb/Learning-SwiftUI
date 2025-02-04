//
//  MVVMSwiftuiApp.swift
//  MVVMSwiftui
//
//  Created by Eslam on 04/02/2025.
//

import SwiftUI

@main
struct MVVMSwiftuiApp: App {
    @StateObject var viewModel = TaskViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
