//
//  NavigationLinkFix.swift
//  Debugging
//
//  Created by Eslam on 17/02/2025.
//

import SwiftUI

struct NavigationLinkFix: View {
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink(destination: Text("Detail View")
                    .transition(.move(edge: .trailing))) { // Custom transition
                        Text("Go to Detail View")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
            }
        }
    }
}

#Preview {
    NavigationLinkFix()
}
