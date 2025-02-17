//
//  ExampleTwoFixBinding.swift
//  Debugging
//
//  Created by Eslam on 17/02/2025.
//

import SwiftUI

struct ExampleTwoFixBinding: View {
    @State private var isOn = false

        var body: some View {
            Toggle("Switch", isOn: $isOn)  // Proper binding
                .padding()
                .onChange(of: isOn) { _,value in
                    print("Toggle state changed to \(value)")
                }
        }
}

#Preview {
    ExampleTwoFixBinding()
}
