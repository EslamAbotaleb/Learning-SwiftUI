//
//  NetworkImplementation.swift
//  SwiftUICrypto
//
//  Created by Eslam on 13/02/2025.
//

import Foundation
extension EndPoint {
    func urlRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        if let parameters = parameters {
            if method == .get {
                var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                components?.queryItems = parameters.map {
                    URLQueryItem(name: $0.key, value: "\($0.value)")
                }
                request.url = components?.url
            } else {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters)
            }
        }
        return request
    }
}
