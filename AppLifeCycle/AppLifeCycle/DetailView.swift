//
//  DetailView.swift
//  AppLifeCycle
//
//  Created by Eslam on 01/02/2025.
//

import SwiftUI

// Detail view that displays counter value received through @Binding
struct DetailView: View {
    // @Binding property wrapper to receive and bind to a value from another view
    @Binding var counter: Int

    var body: some View {
        VStack {
            Text("Detail View")
                .font(.title)

            Text("Counter: \(counter)")
                .font(.headline)
        }
        .padding()
    }
}

#Preview {
    DetailView(counter: .constant(2))
}
