//
//  StateIssueExampleTwo.swift
//  Debugging
//
//  Created by Eslam on 18/02/2025.
//

import SwiftUI

struct StateIssueExampleTwo: View {
    @State private var counter = 0
    var body: some View {
        VStack {
            Text("Parent Counter: \(counter)")
                .padding()

            Button("Increment") {
                counter += 1 // Incrementing counter triggers view updates
            }
            /// cause of action button increment if pressed the child view will render and this not related yet to the behaviours button
            EquatableView(content:  ChildStateIssueView())
           // ChildStateIssueView()
        }
    }
}

#Preview {
    StateIssueExampleTwo()
}
