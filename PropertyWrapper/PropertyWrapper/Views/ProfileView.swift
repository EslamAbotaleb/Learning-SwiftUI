//
//  ProfileView.swift
//  PropertyWrapper
//
//  Created by Eslam on 01/02/2025.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var userData: UserData

    var body: some View {
        Form {
            TextField("Name", text: $userData.name)
            Stepper("Age: \(userData.age)", value: $userData.age)
        }
    }
}

#Preview {
    ProfileView(userData: UserData())
}
