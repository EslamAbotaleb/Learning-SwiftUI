//
//  ExchangeRate.swift
//  LOTRConverter
//
//  Created by Eslam on 27/01/2025.
//

import SwiftUI

struct ExchangeRate: View {

    let leftImage: ImageResource
    let exchangeText: String
    let rightImage: ImageResource

    var body: some View {
        HStack {
            // Left currency image
            Image(leftImage)
                .customImageModifier()
                .frame(height: 33)

            // Exchange rate text
            Text(exchangeText)
            // Right currency image
            Image(rightImage)
                .customImageModifier()
                .frame(height: 33)
        }
    }
}

#Preview {
    ExchangeRate(leftImage: .silverpiece,
                 exchangeText: "1 Gold Piece = 4 Gold Pennies", rightImage: .silverpenny)
}
