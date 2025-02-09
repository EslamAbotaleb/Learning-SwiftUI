//
//  UserListView.swift
//  Networking
//
//  Created by Eslam on 09/02/2025.
//

import SwiftUI
import Combine

struct UserListView: View {
    @State private var users: [User] = []
    @State private var cancellables = Set<AnyCancellable>()
    var body: some View {
        List(users) {
            user in
            VStack(alignment: .leading) {
                Text(user.name)
                Text(user.email)
            }
        }
        .onAppear {
            API().fetchUsers()
                .sink(receiveCompletion: { _ in }, receiveValue: { users in
                    self.users = users
                })
                .store(in: &cancellables)
        }
    }
    
}

#Preview {
    UserListView()
}
