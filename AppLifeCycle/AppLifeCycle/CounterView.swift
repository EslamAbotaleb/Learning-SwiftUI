//
//  CounterView.swift
//  AppLifeCycle
//
//  Created by Eslam on 01/02/2025.
//

import SwiftUI

struct CounterView: View {
    // @State property wrapper for managing internal state
    @State private var counter = 0

    var body: some View {
        VStack {
            Text("Counter: \(counter)")
                .font(.headline)

            // Button to increment counter value
            Button("Increment") {
                // Updating @State property triggers view update
                counter += 1
            }

            // Navigate to another view passing @Binding
            NavigationLink(destination: DetailView(counter: $counter)) {
                Text("Go to Detail View")
            }
        }
        .padding()
    }
}

#Preview {
    CounterView()
}
