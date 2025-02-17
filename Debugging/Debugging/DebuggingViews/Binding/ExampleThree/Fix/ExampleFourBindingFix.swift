//
//  ExampleFourBindingFix.swift
//  Debugging
//
//  Created by Eslam on 17/02/2025.
//

import SwiftUI


struct ExampleFourBindingFix: View {
    @State private var count = 0
    var body: some View {
        VStack {
            ChildExampleFourBindingIssue(count: $count)
            Button("Increment") {
                count += 1  // Update the state directly without needing DispatchQueue.main.async
            }
        }
    }
}
struct ChildExampleFourBindingFix: View {
    @Binding var count: Int

    var body: some View {
        Text("Count: \(count)")
    }
}
#Preview {
    ExampleFourBindingFix()
}
