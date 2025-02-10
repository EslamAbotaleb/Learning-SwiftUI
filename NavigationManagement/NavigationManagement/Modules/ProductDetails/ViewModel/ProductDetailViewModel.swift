//
//  ProductDetailViewModel.swift
//  NavigationManagement
//
//  Created by Eslam on 10/02/2025.
//

import Foundation
class ProductDetailViewModel: ObservableObject {
    @Published var product: Product
    init(product: Product) {
        self.product = product
    }
}
