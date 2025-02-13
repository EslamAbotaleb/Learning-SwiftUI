//
//  CoinImageView.swift
//  SwiftUICrypto
//
//  Created by Eslam on 13/02/2025.
//

import SwiftUI

struct CoinImageView: View {
    @StateObject  var viewModel: CoinImageViewModel

    init(coin: CoinModel) {
        _viewModel = StateObject(wrappedValue: CoinImageViewModel(coin: coin))
    }


    var body: some View {
        ZStack {
            if let image = viewModel.coin?.image{
                //                Image(uiImage: image)
                //                    .resizable()
                //                    .scaledToFit()
                ImageURLView(url: URL(string: image)!)
            }
                //                    .resizable()

//            } else if viewModel.isLoading {
//                ProgressView()
//            } else {
//                Image(systemName: "questionmark")
//                    .foregroundStyle(Color.secondaryText)
//            }
        }
    }
}

//#Preview {
//    CoinImageView()
//}
