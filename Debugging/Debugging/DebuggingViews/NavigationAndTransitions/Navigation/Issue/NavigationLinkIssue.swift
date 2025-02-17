//
//  NavigationLinkIssue.swift
//  Debugging
//
//  Created by Eslam on 17/02/2025.
//

import SwiftUI
//MARK: - There NavigationLink without NavigationStack
struct NavigationLinkIssue: View {
    var body: some View {
        VStack {
            Text("Welcome to swiftUI")
            NavigationLink {
                Text("Eslam")
            } label: {
                Text("Go to detail view")
            }
        }
    }
}

#Preview {
    NavigationLinkIssue()
}
