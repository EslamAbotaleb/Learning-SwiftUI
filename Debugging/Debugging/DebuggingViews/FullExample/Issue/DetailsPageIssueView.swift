//
//  DetailsPageIssueView.swift
//  Debugging
//
//  Created by Eslam on 17/02/2025.
//

import SwiftUI

struct DetailsPageIssueView: View {
    let item: String

    var body: some View {

        VStack {
            Text("Detail View for \(item)")
                .font(.largeTitle)
            Spacer()
        }
        .padding()
        .navigationBarTitle("Detail", displayMode: .inline)
    }
}

