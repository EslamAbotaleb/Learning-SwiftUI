//
//  ItemRow.swift
//  Debugging
//
//  Created by Eslam on 17/02/2025.
//

import SwiftUI

struct ItemRow: View {
    let item: Item
    var body: some View {
        let _ = Self._printChanges()
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.blue)
                .shadow(color: .gray, radius: 5, x: 0, y: 3)
            Text(item.name)
                .background(Color.blue)
                .foregroundColor(.white)
                .padding(5)
        }
        .padding()
    }
}
