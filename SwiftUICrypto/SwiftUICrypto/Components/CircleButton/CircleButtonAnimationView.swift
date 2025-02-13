//
//  CircleButtonAnimationView.swift
//  SwiftUICrypto
//
//  Created by Eslam on 12/02/2025.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    @Binding  var animate: Bool
    var body: some View {
        Circle()
            .stroke(lineWidth: 5.0)
            .scale(animate ? 1.0 : 0.0)
            .opacity(animate ? 1.0 : 0.0)
            .animation(animate ? Animation.easeOut(duration: 1.0) : .none, value: animate)
//            .onAppear {
//                animate.toggle()
//            }
    }
}

#Preview {
    CircleButtonAnimationView(animate: .constant(false))
}
/*
 .onAppear {
     animate.toggle()
 }
 */
