//
//  Markets.swift
//  SwiftUICrypto
//
//  Created by Eslam on 13/02/2025.
//

import Foundation

struct MarketsEndPoint: EndPoint {
    var baseURL: URL {
        URL(string: "https://api.coingecko.com")!
    }
    var path: String {
        "/api/v3/coins/markets"
    }
    var method: HTTPMethod {
        .get
    }
    var headers: [String : String]? {
        ["Content-Type": "application/json"]
    }

    var parameters: [String : Any]? {
         [
            "vs_currency": "usd",
            "oder": "market_cap_desc",
            "per_page": "250",
            "page": "1",
            "sparkline": "true",
            "price_change_percentage": "24h"
        ]
    }
}

