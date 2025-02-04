//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Eslam on 27/01/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            // Background Image
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            CurrencyExchange(showExchangeInfo: false)
        }
    }
}
#Preview {
    ContentView()
}
