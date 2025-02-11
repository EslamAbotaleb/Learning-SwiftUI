//
//  ProductDetailView.swift
//  NavigationManagement
//
//  Created by Eslam on 10/02/2025.
//

import SwiftUI

struct ProductDetailView: View {
    @StateObject private var viewModel: ProductDetailViewModel
    @EnvironmentObject var router: RouterViewModel<RoutesNames>

    init(product: Product) {
        _viewModel = StateObject(wrappedValue: ProductDetailViewModel(product: product))
    }
    var body: some View {
        VStack {
            Text(viewModel.product.name)
                .font(.largeTitle)
                .bold()
            Text("$\(viewModel.product.price, specifier: "%.2f")")
                .font(.title)
                .padding(.all)
        }
        .padding()
        .background(Color(light: .teal, dark: Color.blue))
        .foregroundStyle(.white)
        .toolbar {  // Add toolbar items
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    // Will back into categories view
//                    router.navigateBack(2)
                    router.navigateToRoot()
                }) {
                    Text("Categories")
                }
            }
        }
        .navigationTitle("Product Detail")

    }
}
//
#Preview {
    ProductDetailView(product: Product(id: UUID(), name: "", price: 10.20))
}
