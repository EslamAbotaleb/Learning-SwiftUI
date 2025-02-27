//
//  ContentView.swift
//  ConcurrencyApp
//
//  Created by Eslam on 26/02/2025.
//

import SwiftUI

struct ContentView: View {
    init() {
        let _ = ModernApproach()
    }
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
