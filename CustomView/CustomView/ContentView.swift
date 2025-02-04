//
//  ContentView.swift
//  CustomView
//
//  Created by Eslam on 03/02/2025.
//

import SwiftUI
//
//struct ContentView: View {
//    var body: some View {
//        NavigationStack {
//            VStack {
//                AlertView {
//                    Image(systemName: "exclamationmark.shield.fill")
//                        .resizable()
//                        .frame(width: 65, height: 65)
//                    Text("Here is a custom alert with view builder")
//                } cancel: {
//                    print("Cancel Pressed!!!")
//                } confirm: {
//                    print("Confirm Pressed!!!")
//                }
//                MyCustomViewBuilder()
//                MyCustomViewBuilder().contextMenu {
//                    Text("Cut")
//                    Text("Copy")
//                    Text("Paste")
//
//                }
//            }
//            .navigationTitle("View Builders")
//        }
//    }
//}

// ContentView where you apply contextMenu
struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                AlertView {
                    Image(systemName: "exclamationmark.shield.fill")
                        .resizable()
                        .frame(width: 65, height: 65)
                    Text("Here is a custom alert with view builder")
                } cancel: {
                    print("Cancel Pressed!!!")
                } confirm: {
                    print("Confirm Pressed!!!")
                }
                // Custom MyCustomViewBuilder usage with contextMenu applied directly
                MyCustomViewBuilder()
                    .customContextMenu {
                        Button("Option 1") {
                            print("Option 1 selected")
                        }
                        Button("Option 2") {
                            print("Option 2 selected")
                        }
                        Button("Option 3") {
                            print("Option 3 selected")
                        }
                    }
                MyCustomViewBuilder()
                    .customContextMenu {
                        Button("Cut") {
                            print("Cut selected")
                        }
                        Button("Copy") {
                            print("Copy selected")
                        }
                        Button("Paste") {
                            print("Paste selected")
                        }
                    }
            }
            .navigationTitle("View Builders")
        }
    }
}
#Preview {
    ContentView()
}
