//
//  Models.swift
//  SwiftUICrypto
//
//  Created by Eslam on 13/02/2025.
//

//https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd

final class CoinModel: Codable, Identifiable, Sendable {
    let id, symbol, name: String
    let image: String
    let currentPrice: Double
    let marketCap, marketCapRank, fullyDilutedValuation, totalVolume: Double?
    let high24H, low24H, priceChange24H, priceChangePercentage24H: Double?
    let marketCapChange24H, marketCapChangePercentage24H, circulatingSupply, totalSupply: Double?
    let maxSupply: Double?
    let ath, athChangePercentage: Double?
    let athDate: String?
    let atl, atlChangePercentage: Double?
    let atlDate: String?
    let lastUpdated: String?
    let currentHoldings: Double?
    let sparklineIn7D: SparklineIn7D?

    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case totalVolume = "total_volume"
        case high24H = "high_24h"
        case low24H = "low_24h"
        case priceChange24H = "price_change_24h"
        case priceChangePercentage24H = "price_change_percentage_24h"
        case marketCapChange24H = "market_cap_change_24h"
        case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case sparklineIn7D = "sparkline_in_7d"
        case currentHoldings
        case ath
        case athChangePercentage = "ath_change_percentage"
        case athDate = "ath_date"
        case atl
        case atlChangePercentage = "atl_change_percentage"
        case atlDate = "atl_date"
        case lastUpdated = "last_updated"
    }
    init(id: String, symbol: String, name: String, image: String, currentPrice: Double, marketCap: Double? = nil, marketCapRank: Double? = nil, fullyDilutedValuation: Double? = nil, totalVolume: Double? = nil, high24H: Double? = nil, low24H: Double? = nil, priceChange24H: Double? = nil, priceChangePercentage24H: Double? = nil, marketCapChange24H: Double? = nil, marketCapChangePercentage24H: Double? = nil, circulatingSupply: Double? = nil, totalSupply: Double? = nil, maxSupply: Double? = nil, ath: Double? = nil, athChangePercentage: Double? = nil, athDate: String? = nil, atl: Double? = nil, atlChangePercentage: Double? = nil, atlDate: String? = nil, lastUpdated: String? = nil, currentHoldings: Double? = nil, sparklineIn7D: SparklineIn7D? = nil) {

           self.id = id
           self.symbol = symbol
           self.name = name
           self.image = image
           self.currentPrice = currentPrice
           self.marketCap = marketCap
           self.marketCapRank = marketCapRank
           self.fullyDilutedValuation = fullyDilutedValuation
           self.totalVolume = totalVolume
           self.high24H = high24H
           self.low24H = low24H
           self.priceChange24H = priceChange24H
           self.priceChangePercentage24H = priceChangePercentage24H
           self.marketCapChange24H = marketCapChange24H
           self.marketCapChangePercentage24H = marketCapChangePercentage24H
           self.circulatingSupply = circulatingSupply
           self.totalSupply = totalSupply
           self.maxSupply = maxSupply
           self.ath = ath
           self.athChangePercentage = athChangePercentage
           self.athDate = athDate
           self.atl = atl
           self.atlChangePercentage = atlChangePercentage
           self.atlDate = atlDate
           self.lastUpdated = lastUpdated
           self.currentHoldings = currentHoldings
           self.sparklineIn7D = sparklineIn7D
       }

    func updateHoldings(amount: Double) -> CoinModel {
        return CoinModel(
            id: self.id,
            symbol: self.symbol,
            name: self.name,
            image: self.image,
            currentPrice: self.currentPrice,
            marketCap: self.marketCap,
            marketCapRank: self.marketCapRank,
            fullyDilutedValuation: self.fullyDilutedValuation,
            totalVolume: self.totalVolume,
            high24H: self.high24H,
            low24H: self.low24H,
            priceChange24H: self.priceChange24H,
            priceChangePercentage24H: self.priceChangePercentage24H,
            marketCapChange24H: self.marketCapChange24H,
            marketCapChangePercentage24H: self.marketCapChangePercentage24H,
            circulatingSupply: self.circulatingSupply,
            totalSupply: self.totalSupply,
            maxSupply: self.maxSupply,
            ath: self.ath,
            athChangePercentage: self.athChangePercentage,
            athDate: self.athDate,
            atl: self.atl,
            atlChangePercentage: self.atlChangePercentage,
            atlDate: self.atlDate,
            lastUpdated: self.lastUpdated,
            currentHoldings: amount,  // Set the updated holdings amount here
            sparklineIn7D: self.sparklineIn7D
        )
    }

    var currentHoldingsValue: Double {
        return (currentHoldings ?? 0) * (currentPrice)
    }

    var rank: Int {
        return Int(marketCapRank ?? 0)
    }
}
struct SparklineIn7D: Codable {
    let price: [Double]?
}
