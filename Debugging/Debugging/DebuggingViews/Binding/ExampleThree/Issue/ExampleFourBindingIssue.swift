//
//  ExampleFourBindingIssue.swift
//  Debugging
//
//  Created by Eslam on 17/02/2025.
//

import SwiftUI

struct ExampleFourBindingIssue: View {
    @State private var count = 0
    var body: some View {
        VStack {
            ChildExampleFourBindingIssue(count: $count)
            Button("Increment") {
                DispatchQueue.main.async {
                    count += 1
                }
            }
        }
    }
}
struct ChildExampleFourBindingIssue: View {
    @Binding var count: Int

    var body: some View {
        Text("Count: \(count)")
    }
}
#Preview {
    ExampleFourBindingIssue()
}
