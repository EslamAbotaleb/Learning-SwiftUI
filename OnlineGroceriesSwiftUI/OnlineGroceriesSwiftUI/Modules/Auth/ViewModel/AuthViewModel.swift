//
//  AuthViewModel.swift
//  OnlineGroceriesSwiftUI
//
//  Created by Eslam on 12/02/2025.
//

import SwiftUI
class AuthViewModel: ObservableObject {
    @Published var txtEmail = ""
    @Published var txtPassword = ""
    @Published var isShowPassword = false
}
