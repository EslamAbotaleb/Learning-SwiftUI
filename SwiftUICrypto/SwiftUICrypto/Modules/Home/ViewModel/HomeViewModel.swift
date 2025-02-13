//
//  HomeViewModel.swift
//  SwiftUICrypto
//
//  Created by Eslam on 12/02/2025.
//

import Foundation

//MARK: - With Combine
/*
 import Combine
 class HomeViewModel: ObservableObject {
 @Published var allCoins: [CoinModel] = []
 @Published var portfolioCoins: [CoinModel] = []

 private let dataService = CoinDataService()
 private var cancellables = Set<AnyCancellable>()

 init() {
 addSubscribers()
 }
 func addSubscribers() {
 dataService.$allCoins
 .sink { [weak self] coins in
 self?.allCoins = coins
 }
 .store(in: &cancellables)
 }
 }
 */
//MARK: - With MainActor
@MainActor
class HomeViewModel: ObservableObject {
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    private let dataService = CoinDataService()
    init() {
        // Call the async fetch function from the CoinDataService
        Task {
            await fetchCoins()
        }
    }

    private func fetchCoins() async {
        do {
            // Wait for the data to be fetched
            try await dataService.fetchCoins()
            self.allCoins = dataService.allCoins
        } catch {
            print("Error fetching coins: \(error.localizedDescription)")
        }
    }
}
