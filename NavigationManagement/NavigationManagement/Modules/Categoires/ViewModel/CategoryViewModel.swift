//
//  CategoryViewModel.swift
//  NavigationManagement
//
//  Created by Eslam on 10/02/2025.
//

import Foundation
class CategoryViewModel: ObservableObject {
    @Published var categories: [String] = []
    init() {
        // Dummy data for categories
        categories = ["Electronics", "Clothing", "Books"]
    }
}
