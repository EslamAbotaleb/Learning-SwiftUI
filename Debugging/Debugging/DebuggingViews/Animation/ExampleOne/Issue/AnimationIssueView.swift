//
//  AnimationIssueView.swift
//  Debugging
//
//  Created by Eslam on 17/02/2025.
//

import SwiftUI

struct AnimationIssueView: View {
    @State private var isPressed = false

    var body: some View {
        Button {
            isPressed.toggle()
        } label: {
            Text("Press me")
                .font(.title)
                .padding()
                .backgroundStyle(isPressed ? .blue : .gray)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .scaleEffect(isPressed ? 1.2 : 1)
                .animation(.easeIn(duration: 0.5), value: isPressed)
        }
    }
}

#Preview {
    AnimationIssueView()
}
