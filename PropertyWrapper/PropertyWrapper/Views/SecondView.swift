//
//  SecondView.swift
//  PropertyWrapper
//
//  Created by Eslam on 01/02/2025.
//

import SwiftUI

struct SecondView: View {
    @Binding var text: String
    var body: some View {
        Text(text)
    }
}

#Preview {
    SecondView(text: .constant("AnyName"))
}
