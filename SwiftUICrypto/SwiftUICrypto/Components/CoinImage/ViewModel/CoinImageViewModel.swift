//
//  CoinImageViewModel.swift
//  SwiftUICrypto
//
//  Created by Eslam on 13/02/2025.
//

import SwiftUI
class CoinImageViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    @Published var coin: CoinModel? = nil
    init(coin: CoinModel? = nil) {
        self.coin = coin
    }
   
}
