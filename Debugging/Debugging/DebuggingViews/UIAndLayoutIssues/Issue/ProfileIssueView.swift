//
//  ProfileView.swift
//  Debugging
//
//  Created by Eslam on 17/02/2025.
//

import SwiftUI

//MARK: - Layout & UI Issue
struct ProfileIssueView: View {
    var profileImage: Image
    var userName: String
    var userDescription: String
    @State private var isPressed = false
    var body: some View {
        VStack {
            /*
             profileImage
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(color: isPressed ? .gray : .clear, radius: 5, x: 0, y: 5)
             */
            ZStack {
                Circle()
                    .fill(Color.white)
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                       .shadow(color: .gray, radius: 3, x: 0, y: 3)
                profileImage
                    .resizable()
                         .scaledToFill()
                         .frame(width: 200, height: 200)
                         .overlay(Circle().stroke(Color.white, lineWidth: 4))
                            .shadow(color: .gray, radius: 3, x: 0, y: 3)
            }
            .frame(width: 250, height: 250)
            Text(userName)
                .font(.title)
                .padding(.top, 10)
                .padding(.bottom, 5)

            Text(userDescription)
                .font(.body)
                .padding(.top, 5)
                .padding(.horizontal, 20)
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    ProfileIssueView(profileImage: Image(.apple), userName: "Eslam", userDescription: "Developer")
}
