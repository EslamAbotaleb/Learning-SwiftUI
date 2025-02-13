//
//  CircleButtonView.swift
//  SwiftUICrypto
//
//  Created by Eslam on 12/02/2025.
//

import SwiftUI

struct CircleButtonView: View {
    let iconName: String
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundStyle(Color.accentColor)
            .frame(width: 50, height: 50)
            .background(Circle()
                .foregroundStyle(Color.background))
            .shadow(color: .accentColor.opacity(0.25), radius: 10, x: 0, y: 0)
            .padding()
    }
}

#Preview {
    CircleButtonView(iconName: "heart.fill")
        .padding()
        .previewLayout(.sizeThatFits)
}
