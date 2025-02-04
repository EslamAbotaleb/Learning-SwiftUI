//
//  CurrencyObservation.swift
//  LOTRConverter
//
//  Created by Eslam on 29/01/2025.
//

import Foundation
import Combine

final class CurrencyObservation: ObservableObject {
    let objectWillChange = PassthroughSubject<Void, Never>()

    @UserDefault("LeftCurrency", defaultValue: String(Currency.platinumPiece.rawValue))
    var storedLeftCurrencyRawValue: String {
        willSet {
            objectWillChange.send()
        }
    }

    @UserDefault("RightCurrency", defaultValue: String(Currency.goldPenny.rawValue))
    var storedRightCurrencyRawValue: String {
        willSet {
            objectWillChange.send()
        }
    }

    var leftCurrency: Currency {
        get {
            return Currency(rawValue: Double(storedLeftCurrencyRawValue) ?? 0.0) ?? .platinumPiece
        }
        set {
            storedLeftCurrencyRawValue = String(newValue.rawValue)
        }
    }

    var rightCurrency: Currency {
        get {
            return Currency(rawValue: Double(storedRightCurrencyRawValue) ?? 0.0) ?? .goldPenny
        }
        set {
            storedRightCurrencyRawValue = String(newValue.rawValue)
        }
    }
}
