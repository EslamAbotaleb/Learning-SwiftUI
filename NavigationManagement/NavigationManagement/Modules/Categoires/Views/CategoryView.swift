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
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue.opacity(0.8))
                    .foregroundStyle(.white)
                    .cornerRadius(10)
            }
            .listRowSeparator(.hidden)
            .buttonStyle(PlainButtonStyle())
        }
        .listStyle(.plain)
        .listStyle(PlainListStyle())
    }
}

#Preview {
    CategoryView()
}
