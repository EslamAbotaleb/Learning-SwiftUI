//
//  RoundedViewWithActionModifier.swift
//  OnlineGroceriesSwiftUI
//
//  Created by Eslam on 11/02/2025.
//

import SwiftUI

//MARK: - Sample custom view for any view just contain (title & action)
struct RoundedViewWithActionModifier: ViewModifier {
    var minHeight: CGFloat = 60
    var maxHeight: CGFloat = 60
    var didTap: (()->())?
    func body(content: Content) -> some View {
        Button {
            didTap?()
        } label: {
            content
                .font(.customfont(.semibold, fontSize: 18))
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
        }
        .frame(minWidth: 0, maxWidth: .infinity,minHeight: minHeight, maxHeight: maxHeight, alignment: .center)
        .background(Color.primaryApp)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

extension View {
    func roundViewWithAction(minHeight: CGFloat, maxHeight: CGFloat, didTap: (() ->())? = nil) -> some View {
        self.modifier(RoundedViewWithActionModifier(minHeight: minHeight, maxHeight: maxHeight, didTap: didTap))
    }
}
