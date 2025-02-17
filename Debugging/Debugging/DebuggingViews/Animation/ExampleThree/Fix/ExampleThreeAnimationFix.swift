//
//  ExampleThreeAnimationFix.swift
//  Debugging
//
//  Created by Eslam on 17/02/2025.
//

import SwiftUI

struct ExampleThreeAnimationFix: View {
    @State private var opacity = 0.0
    var body: some View {
        Text("Hello, World!")
            .opacity(opacity)
            .onAppear {
                withAnimation(.easeIn(duration: 1.0)) {
                    opacity = 1.0
                }
            }
    }
}

#Preview {
    ExampleThreeAnimationFix()
}
