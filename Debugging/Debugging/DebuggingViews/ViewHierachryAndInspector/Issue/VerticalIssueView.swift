//
//  VerticalIssueView.swift
//  Debugging
//
//  Created by Eslam on 17/02/2025.
//

import SwiftUI

struct VerticalIssueView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.red)
                .frame(width: 100, height: 100)
            Rectangle()
                .fill(Color.blue)
                .frame(width: 100, height: 100)
                .offset(x: 50, y: 50)
        }
    }
}

#Preview {
    VerticalIssueView()
}
