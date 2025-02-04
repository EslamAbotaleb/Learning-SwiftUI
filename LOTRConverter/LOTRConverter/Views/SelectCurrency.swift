//
//  SelectCurrency.swift
//  LOTRConverter
//
//  Created by Eslam on 27/01/2025.
//

import SwiftUI

//MARK: - SelectCurrency Using Binding
/*
 struct SelectCurrency: View {
 @Binding var leftCurrency: Currency
 @Binding var rightCurrency: Currency

 var body: some View {
 ZStack {
 // Parchment background image
 Image(.parchment)
 .resizable()
 .ignoresSafeArea()
 .background(.brown)
 VStack {
 Text("Select the currency you are starting with:\(Currency.silverPenny.rawValue)").fontWeight(.bold)

 // Currency icons
 IconGrid(selectedCurrency: $leftCurrency)
 .onAppear {
 print("Loaded left currency: \(leftCurrency)")
 }

 Text("Select the currency you would like to convert to:")
 .fontWeight(.bold)
 .padding(.top)
 IconGrid(selectedCurrency: $rightCurrency)
 .onAppear {
 print("Loaded right currency: \(rightCurrency)")
 }

 // Done button
 DoneButton()
 }
 .padding()
 .multilineTextAlignment(.center)
 .foregroundStyle(.black)
 }
 }
 }
 */
//MARK: - SelectCurrency Using ObservedObject
struct SelectCurrency: View {
    @ObservedObject var currencySelected = CurrencyObservation()
    var body: some View {
        ZStack {
            // Parchment background image
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)

            VStack {
                Text("Select the currency you are starting with: \(currencySelected.storedLeftCurrencyRawValue)")
                    .fontWeight(.bold)

                // Currency icons grid for left currency
                IconGrid(selectedCurrency: $currencySelected.leftCurrency)
                    .onAppear {
                        print("Loaded left currency: \(currencySelected.storedLeftCurrencyRawValue)")

                    }

                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)
                    .padding(.top)

                // Currency icons grid for right currency
                IconGrid(selectedCurrency: $currencySelected.rightCurrency)
                    .onAppear {
                    }

                // Done button
                DoneButton()
            }
            .padding()
            .multilineTextAlignment(.center)
            .foregroundStyle(.black)
        }
    }
}
