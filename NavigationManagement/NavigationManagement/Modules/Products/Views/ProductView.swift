//
//  ProductView.swift
//  NavigationManagement
//
//  Created by Eslam on 10/02/2025.
//

import SwiftUI

struct ProductView: View {
    @EnvironmentObject var router: RouterViewModel<RoutesNames>
    @StateObject private var viewModel: ProductViewModel

    init(category: String) {
        _viewModel = StateObject(wrappedValue: ProductViewModel(category: category))
    }
    var body: some View {
        List(viewModel.products) {
            product in
            Button(action: {
                router.navigate(to: .productDetail(product))
            }) {
                HStack {
                    Text(product.name)
                        .font(.headline)
                    Spacer()
                    Text("$\(product.price, specifier: "%.2f")")
                        .font(.subheadline)
                }
                .padding()
                .background(Color.green.opacity(0.2), in: RoundedRectangle(cornerRadius: 8))
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity)
            }
            .listRowSeparator(.hidden)
            .buttonStyle(PlainButtonStyle())
        }
        .listStyle(.plain)
        .listStyle(PlainListStyle())
        .navigationTitle("Products")
    }
}
