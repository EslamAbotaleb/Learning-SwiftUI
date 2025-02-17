//
//  VerticalFixView.swift
//  Debugging
//
//  Created by Eslam on 17/02/2025.
//

import SwiftUI
/*
 View Hierarchy: Represents the nested structure of views in your app.
 View Debugger: Helps you inspect and visualize this hierarchy to identify issues like misalignment, overlap, or incorrect sizing.
 Fixing Issues: Use the View Debugger to identify problems (such as misalignments or incorrect frames) and then adjust your code (e.g., using proper alignment, spacing, or modifiers like .offset() and .zIndex()).
 */
struct VerticalFixView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.red)
                .frame(width: 100, height: 100)
            Rectangle()
                .fill(Color.blue)
                .frame(width: 100, height: 100)
                .zIndex(1)
                .offset(x: 50, y: 50) // You expect this to be shifted but it's still overlapping

        }
    }
}

#Preview {
    VerticalFixView()
}
