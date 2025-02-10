//
//  ProductViewModel.swift
//  NavigationManagement
//
//  Created by Eslam on 10/02/2025.
//

import Foundation
class ProductViewModel: ObservableObject {
    @Published var products: [Product] = []
    init(category: String) {
        // Dummy data for products
        switch category {
            case "Electronics":
                products = [Product(id: UUID(), name: "Laptop", price: 999.99),
                            Product(id: UUID(), name: "Smartphone", price: 699.99)]
            case "Clothing":
                products = [Product(id: UUID(), name: "T-shirt", price: 19.99),
                            Product(id: UUID(), name: "Jeans", price: 39.99)]
            case "Books":
                products = [Product(id: UUID(), name: "Swift Programming", price: 29.99),
                            Product(id: UUID(), name: "iOS Development", price: 39.99)]
            default:
                products = []
        }
    }
}
