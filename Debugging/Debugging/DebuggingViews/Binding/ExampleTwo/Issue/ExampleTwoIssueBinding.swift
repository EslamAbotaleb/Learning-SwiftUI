//
//  ExampleTwoIssueBinding.swift
//  Debugging
//
//  Created by Eslam on 17/02/2025.
//

import SwiftUI

struct ExampleTwoIssueBinding: View {
    @State private var isOn = false

      var body: some View {
          Toggle("Switch", isOn: $isOn)  // Toggle is unresponsive or doesn't update
      }
}

#Preview {
    ExampleTwoIssueBinding()
}
