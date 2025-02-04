//
//  IconGrid.swift
//  LOTRConverter
//
//  Created by Eslam on 28/01/2025.
//

import SwiftUI
//
//struct IconGrid: View {
//    private let columns = [GridItem(), GridItem(), GridItem()]
//
//    @Binding var selectedCurrency: Currency
//
//    var body: some View {
//        LazyVGrid(columns: columns) {
//
//            ForEach(Currency.allCases) { currency in
//                if selectedCurrency == currency {
//                    CurrencyIcon(currencyImage: currency.image, currencyName: currency.name)
//                        .shadow(color: .black, radius: 10)
//                        .overlay {
//                            RoundedRectangle(cornerRadius: 25)
//                                .stroke(lineWidth: 3)
//                                .opacity(0.5)
//                        }
//                } else {
//                    CurrencyIcon(currencyImage: currency.image, currencyName: currency.name)
//                        .onTapGesture {
//                            self.selectedCurrency = currency
//                        }
//                }
//            }
//        }
//    }
//}
//#Preview {
//    @Previewable @State var selectCurrency: Currency = .silverPiece
//    IconGrid(selectedCurrency: $selectCurrency)
//}

struct IconGrid: View {
    private let columns = [GridItem(), GridItem(), GridItem()]

    @Binding var selectedCurrency: Currency

    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(Currency.allCases, id: \.self) { currency in
                if selectedCurrency == currency {
                    CurrencyIcon(currencyImage: currency.image, currencyName: currency.name)
                        .shadow(color: .black, radius: 10)
                        .overlay {
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(lineWidth: 3)
                                .opacity(0.5)
                        }
                } else {
                    CurrencyIcon(currencyImage: currency.image, currencyName: currency.name)
                        .onTapGesture {
                            print(currency)
                            self.selectedCurrency = currency
                    }
                }
            }
        }
    }
}
