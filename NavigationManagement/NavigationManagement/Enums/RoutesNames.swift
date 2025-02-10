//
//  MyRoutes.swift
//  NavigationManagement
//
//  Created by Eslam on 10/02/2025.
//

import SwiftUI
enum RoutesNames: Routable {
    case categories
    case products(String) // String is the category name
    case productDetail(Product)

    @ViewBuilder
    var body: some View {
        switch self {
            case .categories:
                CategoryView()
            case .products(let category):
                ProductView(category: category)
            case .productDetail(let product):
                ProductDetailView(product: product)
        }
    }
}
