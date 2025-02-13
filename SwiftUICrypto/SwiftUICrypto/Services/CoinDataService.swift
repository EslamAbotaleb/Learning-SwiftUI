//
//  CoinDataService.swift
//  SwiftUICrypto
//
//  Created by Eslam on 13/02/2025.
//

import Foundation
import Combine

//MARK: - With Combine
/*
 class CoinDataService {
 @Published  var allCoins: [CoinModel] = []
 var coinSubscription: AnyCancellable?

 init() {
 getCoins()

 }
 //MARK: - Call api method with combine
 private func getCoins() {
 guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&oder=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h") else {
 return
 }
 coinSubscription = URLSession.shared.dataTaskPublisher(for: url)
 .subscribe(on: DispatchQueue.global(qos: .default))
 .tryMap { output -> Data in
 guard let response = output.response as? HTTPURLResponse,
 response.statusCode >= 200 && response.statusCode < 300 else {
 throw URLError(.badServerResponse)
 }
 return output.data
 }
 .receive(on: DispatchQueue.main)
 .decode(type: [CoinModel].self, decoder: JSONDecoder())
 .sink { (completion) in
 switch completion {
 case .finished:
 break
 case .failure(let error):
 print(error.localizedDescription)
 }
 } receiveValue: { [weak self] (returnedCoins) in
 self?.allCoins = returnedCoins
 self?.coinSubscription?.cancel()
 }
 }
 }
 */
//MARK: - With Async & MainActor


@MainActor
final class CoinDataService: Sendable {
    @Published  var allCoins: [CoinModel] = []
    func fetchCoins() async throws {
        if let coins: [CoinModel] = try await NetworkingManager.download(urlValue: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&oder=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h") {
            self.allCoins = coins
        } else {
            print("Failed to decode coins data.")
        }
    }
}

