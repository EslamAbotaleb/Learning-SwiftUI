//
//  AnimationExampleTwoFix.swift
//  Debugging
//
//  Created by Eslam on 17/02/2025.
//

import SwiftUI

struct AnimationExampleTwoFix: View {
    @State private var moveText = false

    var body: some View {
        VStack {
            Text("Hello, World!")
                .font(.largeTitle)
                .padding()
                .background(Color.yellow)
                .frame(width: 200, height: 100)
                .offset(x: moveText ? 200 : 0)  // The text moves across the screen
                .animation(.easeInOut(duration: 1.0), value: moveText)  // Default animation
            Button("Move Text") {
                moveText.toggle()
            }
        }
    }
}

#Preview {
    AnimationExampleTwoFix()
}
