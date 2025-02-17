//
//  CoinImageView.swift
//  SwiftUICrypto
//
//  Created by Eslam on 13/02/2025.
//

import SwiftUI

struct CoinImageView: View {
    @StateObject var viewModel: CoinImageViewModel

    init(coin: CoinModel) {
        _viewModel = StateObject(wrappedValue: CoinImageViewModel(coin: coin))
    }

    var body: some View {
        if let image = viewModel.coin?.image{
            ImageURLView(url: URL(string: image)!)
        }
    }
}

