//
//  MyButton.swift
//  PropertyWrapper
//
//  Created by Eslam on 01/02/2025.
//

import SwiftUI

struct MyButton: View {
    @State var buttonColor = Color.blue
    var body: some View {
        Button {
            buttonColor = .red
        } label: {
            Text("Press me!")
        }
        .background(buttonColor)
    }
}

#Preview {
    MyButton()
}
