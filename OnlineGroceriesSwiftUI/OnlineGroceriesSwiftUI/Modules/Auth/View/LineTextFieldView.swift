//
//  LineTextFieldView.swift
//  OnlineGroceriesSwiftUI
//
//  Created by Eslam on 12/02/2025.
//

import SwiftUI

struct LineTextFieldView: View {
    @State var placeholder = ""
    @State var title = ""
//    @State var isSecure: Bool = false
    @State var keyboardType: UIKeyboardType = .default
    @Binding var isPassword: Bool
    @Binding var text: String

    var body: some View {
        VStack {
            Text(title)
                .font(.customfont(.semibold, fontSize: 16))
                .foregroundStyle(Color.textTitle)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            if (isPassword) {
                SecureField(placeholder, text: $text)
                    .frame(height: 40)
            } else {
                TextField(placeholder, text: $text)
                    .keyboardType(keyboardType)
                    .autocorrectionDisabled(true)
                    .frame(height: 40)
            }
            Divider()
        }
        .padding(.horizontal, 4)
        .padding(.vertical, 10)
    }
}

//#Preview {
//    LineTextFieldView()
//}
