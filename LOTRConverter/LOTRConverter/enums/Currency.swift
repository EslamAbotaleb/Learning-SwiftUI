//
//  Currency.swift
//  LOTRConverter
//
//  Created by Eslam on 28/01/2025.
//
import SwiftUI

enum Currency: Double, CaseIterable, Identifiable {

    case copperPenny = 6400
    case silverPenny = 64
    case silverPiece = 16
    case goldPenny = 4
    case goldPiece = 1
    case platinumPiece = 0.25

    var id: Currency { self }

    var image: ImageResource {
        switch self {
            case .copperPenny:
                    .copperpenny
            case .silverPenny:
                    .silverpenny
            case .silverPiece:
                    .silverpiece
            case .goldPenny:
                    .goldpenny
            case .goldPiece:
                    .goldpiece
            case .platinumPiece:
                    .platinumgold
        }
    }
    var name: String {
        switch self {
            case .copperPenny:
                "Copper Penny"
            case .silverPenny:
                "Silver Penny"
            case .silverPiece:
                "Silver Piece"
            case .goldPenny:
                "Gold Penny"
            case .goldPiece:
                "Gold Piece"
            case .platinumPiece:
                "Platinum Piece"
        }
    }

    func convert(amount: String,type currency: Currency) -> String {

        guard let doubleAmount = Double(amount) else { return "" }

        let convertedAmount = (doubleAmount / self.rawValue) * currency.rawValue

        return String(format: "%.2f", convertedAmount)
    }
}

