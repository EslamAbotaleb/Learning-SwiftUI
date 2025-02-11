//
//  CategoryView.swift
//  NavigationManagement
//
//  Created by Eslam on 10/02/2025.
//

import SwiftUI

struct CategoryView: View {
    @StateObject private var viewModel = CategoryViewModel()
    @EnvironmentObject var router: RouterViewModel<RoutesNames>

    var body: some View {
        List(viewModel.categories, id: \.self) {
            category in
            Button {
                //MARK: - Action
                router.navigate(to: .products(category))
            } label: {
                Text(category)
            }
            .listRowSeparator(.hidden)
            .buttonStyle(.primary)
        }
        .listStyle(.plain)
        .listStyle(PlainListStyle())
    }
}

#Preview {
    CategoryView()
}
