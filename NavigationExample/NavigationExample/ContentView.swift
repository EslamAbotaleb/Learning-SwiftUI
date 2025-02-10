//
//  ContentView.swift
//  NavigationExample
//
//  Created by Eslam on 09/02/2025.
//

import SwiftUI

struct ContentView: View {
//    @State private var path = [Int]()
//    @State private var pathStore = PathStore()
    @EnvironmentObject var pathStore: PathStore
    var body: some View {
        NavigationStack(path: $pathStore.path) {
            VStack {
                Text("Welcome to the Navigation Demo!")
                    .font(.largeTitle)

                NavigationLink("Go to Next Screen", value: "Next Screen")
            }
            .navigationDestination(for: String.self) { value in
                Text("You navigated to: \(value)")
                    .font(.title)
                    .navigationBarBackButtonHidden(true)
                    .toolbar {
                        Button("Home") {
                            pathStore.path = NavigationPath()
                        }
                    }
            }
        }
//        NavigationStack(path: $pathStore.path) {
//            DetailView(number: 0)
//                .navigationDestination(for: Int.self) { i in
//                    DetailView(number: i)
//                }
//        }
//        NavigationStack(path: $path) {
//            DetailView(path: $path, number: 0)
//                .navigationDestination(for: Int.self) { i in
//                    DetailView(path: $path, number: i)
//                }
//              
////            VStack {
////                Button("Show 32 then 64") {
////                    path = [32, 64]
////                }
////            }
////            .navigationDestination(for: Int.self) { selection in
////                Text("You selected \(selection)")
////            }
//
//        }
        /*
         NavigationStack {
         List(0..<1000) {
         i in
         /*
          NavigationLink("Tap Me") {
          DetailView(number: i)
          }
          */
         NavigationLink("Select \(i)", value: i)
         }
         .navigationDestination(for: Int.self) { selection in
         Text("You selected \(selection)")
         }
         }
         */
    }
}

#Preview {
    ContentView()
}
