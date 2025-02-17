//
//  TransitionFixView.swift
//  Debugging
//
//  Created by Eslam on 17/02/2025.
//

import SwiftUI

struct TransitionFixView: View {

    @Namespace private var animationNamespace
    @State private var isToggled = false

    var body: some View {
        VStack {
            if isToggled {
                Circle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)
                    .matchedGeometryEffect(id: "circle", in: animationNamespace)
            } else {
                Circle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.red)
                    .matchedGeometryEffect(id: "circle", in: animationNamespace)
            }

            Button("Toggle Position") {
                withAnimation {
                    isToggled.toggle()
                }
            }
        }
    }
    /*
     @State private var showText = false

     var body: some View {
     VStack {
     if showText {
     Text("Hello, World!")
     .frame(width: 200, height: 100)
     .background(Color.blue)
     //                    .transition(.scale)
     .transition(
     .asymmetric(
     insertion: AnyTransition.scale.combined(with: .opacity),
     removal: AnyTransition.move(edge: .top).combined(with: .opacity)
     )
     )
     }

     Button("Toggle Text") {
     withAnimation {
     showText.toggle()
     }
     }
     }
     }
     */
}

#Preview {
    TransitionFixView()
}
