//
//  DataOwnerView.swift
//  PropertyWrapper
//
//  Created by Eslam on 01/02/2025.
//

import SwiftUI
struct DataOwnerView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @StateObject private var provider = DataProvider()

    var body: some View {
        Text("provider value: \(provider.currentValue)")
    }
}
