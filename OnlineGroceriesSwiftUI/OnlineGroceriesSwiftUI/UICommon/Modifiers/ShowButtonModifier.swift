//
//  ShowButtonModifier.swift
//  OnlineGroceriesSwiftUI
//
//  Created by Eslam on 12/02/2025.
//

import SwiftUI

struct ShowButtonModifier: ViewModifier {
    @Binding var isShow: Bool
    func body(content: Content) -> some View {
        HStack {
            content
            Button {
                isShow.toggle()
            } label: {
                Image(systemName: !isShow ? "eye.fill" : "eye.slash.fill")
                    .foregroundStyle(Color.textTitle)
            }
        }
    }
}
