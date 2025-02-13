//
//  NetworkManaging.swift
//  SwiftUICrypto
//
//  Created by Eslam on 13/02/2025.
//

import Foundation
protocol NetworkManaging {
    func fetch<T: Decodable>(from endPoint: EndPoint) async throws -> T
}
