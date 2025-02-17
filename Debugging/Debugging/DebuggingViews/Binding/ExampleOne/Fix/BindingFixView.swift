//
//  BindingFixView.swift
//  Debugging
//
//  Created by Eslam on 17/02/2025.
//

import SwiftUI

struct BindingFixView: View {
    @State private var isSwitchOn = false
    
    var body: some View {
        ChildFixView(isSwitchOn: $isSwitchOn) // Correctly passing the binding
    }
}
struct ChildFixView: View {
    @Binding var isSwitchOn: Bool  // Corrected to @Binding
    
    var body: some View {
        Toggle("Switch", isOn: $isSwitchOn) // Now correctly updates the state
    }
}
#Preview {
    BindingFixView()
}
