//
//  CurrencyExchange.swift
//  LOTRConverter
//
//  Created by Eslam on 27/01/2025.
//

import SwiftUI

struct CurrencyExchange: View {

    @State var showExchangeInfo: Bool

    var body: some View {
        VStack {
            // Prancing pony image
            Image(.prancingpony)
                .customImageModifier()
                .frame(height: 200)

            // Currency exchange text
            Text("Currency Exchange")
                .font(.largeTitle)
                .foregroundStyle(.white)
            // Conversion section
            ConversionSectionView()
            // Info button
            Button {
                showExchangeInfo.toggle()
            } label: {
                Image(systemName: "info.circle.fill")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity,
                           alignment: .trailing)
            }
            .padding(.trailing)
        }
        .sheet(isPresented: $showExchangeInfo) {
            ExchangeInfo()
        }
    }
}

#Preview {
    CurrencyExchange(showExchangeInfo: false)
}
