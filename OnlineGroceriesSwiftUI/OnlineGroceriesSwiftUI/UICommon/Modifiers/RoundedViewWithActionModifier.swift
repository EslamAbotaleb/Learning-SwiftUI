//
//  RoundedViewWithActionModifier.swift
//  OnlineGroceriesSwiftUI
//
//  Created by Eslam on 11/02/2025.
//

import SwiftUI

//MARK: - Sample custom view for any view not button just contain (title & action)
struct RoundedViewOptionalActionModifier: ViewModifier {
    var minHeight: CGFloat = 60
    var maxHeight: CGFloat = 60
    var didTap: (()->())?
    func body(content: Content) -> some View {
        let baseView = content
            .font(.customfont(.semibold, fontSize: 18))
            .foregroundStyle(.white)
            .multilineTextAlignment(.center)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: minHeight, maxHeight: maxHeight, alignment: .center)
            .background(Color.primaryApp)
            .clipShape(RoundedRectangle(cornerRadius: 20))
        if let action = didTap {
            baseView.onTapGesture {
                action()
            }
        } else {
            baseView
        }
    }
}

extension View {
    func roundViewWithAction(minHeight: CGFloat, maxHeight: CGFloat, didTap: (() ->())? = nil) -> some View {
        self.modifier(RoundedViewOptionalActionModifier(minHeight: minHeight, maxHeight: maxHeight, didTap: didTap))
    }
}
