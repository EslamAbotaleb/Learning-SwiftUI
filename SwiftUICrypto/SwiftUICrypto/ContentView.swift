//
//  ContentView.swift
//  SwiftUICrypto
//
//  Created by Eslam on 12/02/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            VStack(spacing: 32) {
                Text("Accent Color")
                    .foregroundStyle(Color(.accent))
                Text("Secondary Text Color")
                    .foregroundStyle(Color.secondaryText)
                Text("Red Color")
                    .foregroundStyle(Color(.customRed))
                Text("Green Color")
                    .foregroundStyle(Color(.customGreen))
            }
            .font(.headline)
        }
    }
}

#Preview {
    ContentView()
}
