//
//  ImageURLView.swift
//  SwiftUICrypto
//
//  Created by Eslam on 13/02/2025.
//
import SwiftUI

struct ImageURLView: View {
    let url: URL
    var body: some View {
        AsyncImage(
            url: url,
            transaction: Transaction(animation: .easeInOut)
        ) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .transition(.scale(scale: 0.1, anchor: .center))
                    .padding(8)
            case .failure:
                Image(systemName: "wifi.slash")
            @unknown default:
                EmptyView()
            }
        }
        .frame(width: 44, height: 44)
        .background(Color.clear)
        .clipShape(Circle())

    }
}
