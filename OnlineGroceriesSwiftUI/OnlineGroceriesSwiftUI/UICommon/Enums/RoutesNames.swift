//
//  RoutesNames.swift
//  OnlineGroceriesSwiftUI
//
//  Created by Eslam on 11/02/2025.
//

import SwiftUI
enum RoutesNames: Routable {
    case signIn
    @ViewBuilder
    var body: some View {
        switch self {
            case .signIn:
                SignInView()
        }
    }
}
