//
//  ExampleThreeAnimationIssue.swift
//  Debugging
//
//  Created by Eslam on 17/02/2025.
//

import SwiftUI

struct ExampleThreeAnimationIssue: View {
    @State private var opacity = 0.0

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .opacity(opacity)
            .onAppear {
                opacity = 1.0
            }
    }
}

#Preview {
    ExampleThreeAnimationIssue()
}
