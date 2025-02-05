//
//  ContentView.swift
//  Gestures
//
//  Created by Eslam on 05/02/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var currentAmount = 0.0
    @State private var finalAmount = 1.0

    var body: some View {
//        VStack {
            Text("Hello, world!")
                .scaleEffect(finalAmount + currentAmount)
                .gesture(MagnifyGesture()
                        .onChanged { value in
                            currentAmount = value.magnification
                        }
                        .onEnded { value in
                            finalAmount += currentAmount
                            currentAmount = 0
                        })
//        }
//        .padding()
    }
}

#Preview {
    ContentView()
}
