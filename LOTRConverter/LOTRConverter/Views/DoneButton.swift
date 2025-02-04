//
//  DoneButton.swift
//  LOTRConverter
//
//  Created by Eslam on 27/01/2025.
//

import SwiftUI

struct DoneButton: View {
    @Environment(\.dismiss) var dismissPage
    
    var body: some View {
        Button {
            dismissPage()
        } label: {
            Text("Done")
        }
        .buttonStyle(.borderedProminent)
        .tint(.brown.mix(with: .black, by: 0.2))
        .font(.largeTitle)
        .padding()
        .foregroundStyle(.white)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    DoneButton()
}
