//
//  ColorPickerView.swift
//  PropertyWrapper
//
//  Created by Eslam on 01/02/2025.
//

import SwiftUI

struct ColorPickerView: View {
    @Binding var selectedColor: Color
    @Environment(\.currentUser) var currentUser

    let colors: [Color] = [.red, .green, .blue, .yellow, .orange]

    var body: some View {
        HStack {
            ForEach(colors, id: \.self) { color in
                Rectangle()
                    .fill(color)
                    .frame(width: 50, height: 50)
                    .onTapGesture {
                        selectedColor = color
                    }
            }
        }
    }
}
