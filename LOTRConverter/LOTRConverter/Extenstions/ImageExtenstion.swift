//
//  ImageExtenstion.swift
//  LOTRConverter
//
//  Created by Eslam on 27/01/2025.
//

import SwiftUI
extension Image {
    func customImageModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
    }
}
