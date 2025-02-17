//
//  RedrawView.swift
//  Debugging
//
//  Created by Eslam on 17/02/2025.
//

import SwiftUI

struct RedrawView: View {
    private let score: Int
    @State private var isTitleRotating = true
    @State private var isTitleScaling = true
    @StateObject private var viewModel = RedrawViewModel()

    init(score: Int) {
        self.score = score
    }
    var body: some View {
       VStack(spacing: 10.0) {
         ScoreTitle()
         Text("\(viewModel.score)")
       }
     }
//     @StateObject private var viewModel = ContentViewModel()
}
private struct ScoreTitle: View {
    @State private var isTitleRotating = true
    @State private var isTitleScaling = true
    var body: some View {
    Text("Your score is")
      .scaleEffect(isTitleScaling ? 1.2 : 1.0)
      .rotationEffect(
        Angle(degrees: isTitleRotating
                          ? .random(in: -10.0...0.0)
                          : .random(in: 0.0...10.0))
      )
      .onAppear {
        withAnimation(
          .easeInOut(duration: 0.5).delay(0.1).repeatForever()
        ) { isTitleScaling.toggle() }
        withAnimation(
          .easeInOut(duration: 1.0).delay(0.2).repeatForever()
        ) { isTitleRotating.toggle() }
      }
    }
  }

//#Preview {
//    RedrawView()
//}
