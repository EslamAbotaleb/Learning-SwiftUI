//
//  MVVMSwiftuiApp.swift
//  MVVMSwiftui
//
//  Created by Eslam on 04/02/2025.
//

import SwiftUI

@main
struct MVVMSwiftuiApp: App {
    @StateObject var viewModel = TodoService()
     var todoService = TodoService()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
