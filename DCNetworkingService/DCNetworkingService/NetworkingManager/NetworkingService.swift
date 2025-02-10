//
//  NetworkingService.swift
//  DCNetworkingService
//
//  Created by Eslam on 09/02/2025.
//

import SwiftUI
class NetworkingService: ObservableObject {
    let url: URL
    init(url: URL) {
        self.url = url
    }

    func fetchData(completion: @escaping(Result<Data,Error>) -> ()) {
        let task = URLSession.shared.dataTask(with: url) {
            data, response, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                completion(.success(data))
            }
        }
        task.resume()
    }
}
