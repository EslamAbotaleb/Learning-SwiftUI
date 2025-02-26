//
//  ChildStateIssueView.swift
//  Debugging
//
//  Created by Eslam on 18/02/2025.
//

import SwiftUI

struct ChildStateIssueView: View, Equatable {
    let items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]  // Static list of items

    var body: some View {
        List(items, id: \.self) { item in
            Text(item)
        }
        .frame(height: 200)
    }
}

#Preview {
    ChildStateIssueView()
}
