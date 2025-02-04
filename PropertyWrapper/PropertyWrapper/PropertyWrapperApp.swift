//
//  PropertyWrapperApp.swift
//  PropertyWrapper
//
//  Created by Eslam on 31/01/2025.
//

import SwiftUI

@main
struct PropertyWrapperApp: App {
//    @StateObject var dataProvider = DataProvider()
    @StateObject var userManager = UserManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userManager)
//            EnvironmentUsingView()
//                .environmentObject(dataProvider)
        }
    }
}
