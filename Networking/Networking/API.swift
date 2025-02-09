//
//  API.swift
//  Networking
//
//  Created by Eslam on 09/02/2025.
//

import Foundation
import Combine

class API {
    let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
    let decoder = JSONDecoder()

    func fetchUsers() -> AnyPublisher<[User], Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [User].self, decoder: decoder)
            .eraseToAnyPublisher()
    }
}
