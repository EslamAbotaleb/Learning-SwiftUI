//
//  EmphasizedLayout.swift
//  ViewModifier
//
//  Created by Eslam on 03/02/2025.
//

import SwiftUI
struct EmphasizedLayout: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(.yellow)
            .border(.red)
    }
}


