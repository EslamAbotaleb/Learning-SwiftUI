//
//  ContentView.swift
//  MacroTutoiral
//
//  Created by Eslam on 06/02/2025.
//

import SwiftUI
import MacroTut
//import Foundation

struct ContentView: View {
//    let url = #URL("https://www.apple.com")
//    let userMail = #validateEmail("eslam")
    let userEmail = #validateEmail("eslamabotaleb@gmail.com")
    var body: some View {
        VStack {
            Text("in binary is \(#binaryString(10))")
//            Text("Mail Is:\(userMail)")

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
