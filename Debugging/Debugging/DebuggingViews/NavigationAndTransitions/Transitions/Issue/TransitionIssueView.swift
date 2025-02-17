//
//  TransitionIssueView.swift
//  Debugging
//
//  Created by Eslam on 17/02/2025.
//

import SwiftUI

struct TransitionIssueView: View {
    @State private var showText = false

    var body: some View {
        VStack {
            if showText {
                Text("Hello, World!")
                    .frame(width: 200, height: 100)
                    .background(Color.blue)
            }
            Button("Toggle Text") {
                withAnimation {
                    showText.toggle()
                }
            }
        }
    }
}

#Preview {
    TransitionIssueView()
}
