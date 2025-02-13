//
//  EndPoint.swift
//  SwiftUICrypto
//
//  Created by Eslam on 13/02/2025.
//

import Foundation
protocol EndPoint {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var parameters: [String: Any]? { get }
}
