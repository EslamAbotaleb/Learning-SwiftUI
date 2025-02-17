//
//  DetailsPageView.swift
//  Debugging
//
//  Created by Eslam on 17/02/2025.
//

import SwiftUI

struct DetailsPageView: View {
    let item: Item

    var body: some View {
        let _ = Self._printChanges()

        VStack {
            Text("Detail View for \(item.name)")
                .font(.largeTitle)
            Spacer()
        }
        .padding()
        .navigationBarTitle("Detail", displayMode: .inline)
    }
}

//#Preview {
//    DetailsPageView()
//}
