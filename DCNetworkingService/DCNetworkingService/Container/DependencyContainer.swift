//
//  DependencyContainer.swift
//  DCNetworkingService
//
//  Created by Eslam on 09/02/2025.
//

import SwiftUI
class DependencyContainer: ObservableObject {
    @Published var networkingService: NetworkingService
    init() {
        self.networkingService = NetworkingService(url: URL(string: "https://nactem.ac.uk/software/acromine/dictionary.py?sf=ax")!)
    }
}
