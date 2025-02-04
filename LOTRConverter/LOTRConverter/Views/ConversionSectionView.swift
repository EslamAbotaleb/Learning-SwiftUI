//
//  ConversionSectionView.swift
//  LOTRConverter
//
//  Created by Eslam on 27/01/2025.
//

import SwiftUI
import TipKit

struct ConversionSectionView: View {

    @State var leftAmount = ""
    @State var rightAmount = ""

    // ObservedObject to watch the changes related to this object then update content into UI
//    @ObservedObject var currencySelected = CurrencyObservation()
    @StateObject var currencySelected = CurrencyObservation()

    /*
     @State var leftCurrency:  Currency = .silverPenny
     @State var rightCurrency: Currency = .goldPenny
     */

    @State var showSelectCurrency = false

    @FocusState var leftTyping
    @FocusState var rightTyping


    let currencyTip = CurrencyTip()

    var body: some View {
        // Conversion section
        HStack {
            // Left conversion section
            VStack {
                // Currency
                HStack {
                    // Currency image
                    Image(currencySelected.leftCurrency.image)
                        .customImageModifier()
                        .frame(height: 33)
                    // Currency text
                    Text(currencySelected.leftCurrency.name)
                        .font(.headline)
                        .foregroundStyle(.white)
                }

                .padding(.bottom, -5)
                .onTapGesture {
                    showSelectCurrency.toggle()
                    currencyTip.invalidate(reason: .actionPerformed)
                }
                .popoverTip(currencyTip, arrowEdge: .bottom)
                // Textfield
                TextField("Amount", text: $leftAmount)
                    .textFieldStyle(.roundedBorder)
                    .focused($leftTyping)
            }
            Image(systemName: "equal")
                .font(.largeTitle)
                .foregroundStyle(.white)
                .symbolEffect(.pulse)
            // Right conversion section
            VStack {
                HStack {
                    Text(currencySelected.rightCurrency.name)
                        .font(.headline)
                        .foregroundStyle(.white)

                    Image(currencySelected.rightCurrency.image)
                        .customImageModifier()
                        .frame(height: 33)
                }
                .padding(.bottom, -5)
                .onTapGesture {
                    showSelectCurrency.toggle()
                    currencyTip.invalidate(reason: .actionPerformed)
                }
                // Textfield
                TextField("Amount", text: $rightAmount)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.trailing)
                    .focused($rightTyping)
            }
        }
        .padding()
        .background(.black.opacity(0.5))
        .clipShape(.capsule)
        .keyboardType(.decimalPad)
        .frame(maxHeight: .infinity,
               alignment: .top)
        .task {
            try? Tips.configure()
        }
        .onChange(of: leftAmount) {
            if leftTyping {
                rightAmount = currencySelected.leftCurrency.convert(amount: leftAmount, type: currencySelected.rightCurrency)
            }
        }
        .onChange(of: rightAmount) {
            if rightTyping {
                leftAmount = currencySelected.rightCurrency.convert(amount: rightAmount, type: currencySelected.leftCurrency)
            }
        }
        .onChange(of: currencySelected.leftCurrency) { _, newCurrency in
            // Update the left amount whenever the left currency changes
            leftAmount = currencySelected.rightCurrency.convert(amount: leftAmount, type: newCurrency)
        }
        .onChange(of: currencySelected.rightCurrency) { _, newCurrency in
            // Update the left amount whenever the left currency changes
            rightAmount = currencySelected.leftCurrency.convert(amount: rightAmount, type: newCurrency)
        }
        .sheet(isPresented: $showSelectCurrency) {
            SelectCurrency(currencySelected: currencySelected)
        }
    }
}

#Preview {
    ConversionSectionView()
}

