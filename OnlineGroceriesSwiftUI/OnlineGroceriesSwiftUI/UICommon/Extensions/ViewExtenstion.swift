//
//  ViewExtenstion.swift
//  OnlineGroceriesSwiftUI
//
//  Created by Eslam on 11/02/2025.
//

import SwiftUI
//MARK: - View Image
extension Image {
    func customizeImage() -> some View {
        self
        .resizable()
        .scaledToFit()
        .frame(width: 20, height: 20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
    }
}
