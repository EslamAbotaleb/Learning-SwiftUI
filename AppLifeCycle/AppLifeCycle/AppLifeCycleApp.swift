//
//  AppLifeCycleApp.swift
//  AppLifeCycle
//
//  Created by Eslam on 01/02/2025.
//

import SwiftUI

@main
struct AppLifeCycleApp: App {

    @Environment(\.scenePhase) private var scenePhase
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
                .onChange(of: scenePhase) { _, phase in
                    switch phase {
                        case .active:
                            print("active")
                            AppPhaseManager.instance.state = .active
                        case .inactive:
                            print("inactive")
                        case .background:
                            print("background")
                        @unknown default:
                            print("unknown")
                }
            }
        }
    }
}
class AppDelegate: NSObject,UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        return true
    }

}
