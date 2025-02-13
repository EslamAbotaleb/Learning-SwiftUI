//
//  NetworkingManager.swift
//  SwiftUICrypto
//
//  Created by Eslam on 13/02/2025.
//

import Foundation
//
//class NetworkingManager {
//    static func download<T: Codable>(urlValue: String) async throws -> T? {
//        guard let url = URL(string: urlValue) else {
//            throw URLError(.badURL)
//        }
//        let (data, response) = try await URLSession.shared.data(from: url)
//        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
//            throw URLError(.badServerResponse)
//        }
//        // Try to decode as a single object
//        let decoder = JSONDecoder()
//        // Attempt to decode the data as a single object first
//        if let decoded = try? decoder.decode(T.self, from: data) {
//            return decoded
//        }
//        // If that fails, try decoding as an array of objects (generic)
//        if let decodedArray = try? decoder.decode([T].self, from: data) {
//            return decodedArray as? T
//        }
//        // If neither works, throw an error
//        throw NSError(domain: "NetworkingManagerError", code: 1001, userInfo: [NSLocalizedDescriptionKey: "Failed to decode data as either a single object or array"])
//    }
//}
final class NetworkManager: NetworkManaging {
    static let shared = NetworkManager()
    private let session: URLSession

    private init(session: URLSession = .shared) {
        self.session = session
    }

    func fetch<T: Decodable>(from endpoint: EndPoint) async throws -> T {
        let request = try endpoint.urlRequest()
        let (data, response) = try await session.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }

        try validateResponse(httpResponse)

        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            throw NetworkError.decodingFailed
        }
    }

    private func validateResponse(_ response: HTTPURLResponse) throws {
        switch response.statusCode {
        case 200...299:
            return
        case 400...499:
            throw NetworkError.clientError(response.statusCode)
        case 500...599:
            throw NetworkError.serverError(response.statusCode)
        default:
            throw NetworkError.unknownError(response.statusCode)
        }
    }
}
