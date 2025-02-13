//
//  CoinRowView.swift
//  SwiftUICrypto
//
//  Created by Eslam on 13/02/2025.
//

import SwiftUI

struct CoinRowView: View {

    let coin: CoinModel
    let showHoldingColumn: Bool

    var body: some View {
        HStack(spacing: 0) {
            leftColumn
            Spacer()
            if showHoldingColumn {
                centerColumn
            }
            rightColumn
        }
        .font(.subheadline)
    }
}

//#Preview {
//    CoinRowView()
//}
extension CoinRowView {
    private var leftColumn: some View {
        HStack(spacing: 0) {
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundStyle(Color.secondaryText)
                .frame(minWidth: 30)
//            Circle()
            CoinImageView(coin: coin)
                .frame(width: 30, height: 30)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading, 6)
                .foregroundStyle(Color.accentColor)
        }
    }
    private var centerColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentHoldingsValue.asCurrencyWith6Decimals())
                .bold()
            Text((coin.currentHoldings ?? 0).asNumberString())
        }
        .foregroundStyle(Color.accentColor)
    }
    private var rightColumn: some View {
        VStack(alignment: .trailing) {
            Text("\(coin.currentPrice.asCurrencyWith2Decimals())")
                .bold()
                .foregroundStyle(Color.accentColor)
            Text(coin.priceChangePercentage24H?.asPercentString() ?? "")
                .foregroundStyle(
                    (coin.priceChangePercentage24H ?? 0)
                    >= 0
                    ? Color.customGreen
                    : Color.customRed
                )
        }
        .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
    }
}
