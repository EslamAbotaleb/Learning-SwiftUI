//
//  AnimatedButton.swift
//  Debugging
//
//  Created by Eslam on 17/02/2025.
//

import SwiftUI

struct AnimatedButton: View {
    @State var animateButton = true
    var body: some View {
        Button {

        } label: {
            Text("SAVE")
                .font(.system(size: 36, weight: .bold, design: .rounded))
                .foregroundColor(.white)
                .padding(.vertical, 6)
                .padding(.horizontal, 80)
                .background(.red)
                .cornerRadius(50)
                .shadow(color: .secondary, radius: 1, x: 0, y: 5)
        }
        .rotationEffect(Angle(degrees: animateButton ? Double.random(in: -32.0...1.5) : Double.random(in: 0.5...64)))
        .onAppear {
            withAnimation(.easeInOut(duration: 1).delay(0.5).repeatForever(autoreverses: true)) {
                animateButton.toggle()
            }
        }
    }
}

#Preview {
    AnimatedButton()
}
