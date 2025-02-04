//
//  ContentView.swift
//  AppLifeCycle
//
//  Created by Eslam on 01/02/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var timerRunning = false
    @State private var counter = 0
    @State private var count = 0
    @State private var data: String = ""

    var body: some View {
//        VStack {
//          Text("Timer: \(counter)")
//                .font(.title)
//            Spacer()
//        }
//        .padding()
//        .onAppear {
//            startTimer()
//        }
//        .onDisappear {
//            stopTimer()
//        }
//        NavigationView {
//            CounterView()
//        }
//        VStack {
//            Text("Count: \(count)")
//            Button("Increment") {
//                count += 1
//            }
//        }
//        .onChange(of: count) { oldValue, newValue in
//            print("Count changed to:\(newValue) old value is :\(oldValue)")
//        }
        Text(data)
            .onAppear {
                Task {
                    await loadData()
                }
            }
    }
    func loadData() async  {
        try? await Task.sleep(nanoseconds:10_000_000_000)
        data = "Loaded Data!"
    }
    func startTimer() {
           timerRunning = true
           Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
               counter += 1
           }
       }

       func stopTimer() {
           timerRunning = false
       }
}

#Preview {
    ContentView()
}
