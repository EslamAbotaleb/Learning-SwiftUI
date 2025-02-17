//
//  TimeCounterFixView.swift
//  Debugging
//
//  Created by Eslam on 17/02/2025.
//

import SwiftUI

struct TimeCounterFixView: View {
    @State var count = 0

       let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

       var body: some View {
           VStack {
               Text("Count is now: \(count)!")
                   .onReceive(timer) { input in
                       count += 1
                   }
               AnimatedButton()
           }
       }
}

#Preview {
    TimeCounterFixView()
}
