//
//  TimerCountView.swift
//  Debugging
//
//  Created by Eslam on 17/02/2025.
//

import SwiftUI
//MARK: - The problem of a Massive SwiftUI View
struct TimerCountView: View {
    @State var count = 0
    @State var animateButton = true
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        VStack {
            Text("Count is now: \(count)!")
                .onReceive(timer) { input in
                    count += 1
                }
            ///button animation jumps since multiple triggers redraw the same view.
           
        }
      
    }
}

#Preview {
    TimerCountView()
}
