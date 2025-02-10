//
//  Product.swift
//  NavigationManagement
//
//  Created by Eslam on 10/02/2025.
//

import Foundation
struct Product: Identifiable, Hashable {
    let id: UUID
    let name: String
    let price: Double
}
