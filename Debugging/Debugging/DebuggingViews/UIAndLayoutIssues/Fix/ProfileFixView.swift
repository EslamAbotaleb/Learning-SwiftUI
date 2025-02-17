//
//  ProfileView.swift
//  Debugging
//
//  Created by Eslam on 17/02/2025.
//

import SwiftUI
/// Solution:- Using responsive layout techniques such as (Geometry Reader, Flexible Layout)
struct ProfileFixView: View {
    var profileImage: Image
    var userName: String
    var userDescription: String

    var body: some View {
        GeometryReader { geometry in
            VStack {
                ZStack {
                    Circle()
                        .fill(Color.white)
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                           .shadow(color: .gray, radius: 3, x: 0, y: 3)
                    profileImage
                    .resizable()
                    .scaledToFill()
                    .padding(10)
                }

                .frame(width: geometry.size.width * 0.5, height: geometry.size.width * 0.5)
                /*
                 profileImage
                 .resizable()
                 .scaledToFill()
                 .frame(width: geometry.size.width * 0.5, height: geometry.size.width * 0.5)  // Dynamic sizing
                 .clipShape(Circle())
                 .overlay(Circle().stroke(Color.white, lineWidth: 4))
                 .shadow(radius: 10)
                 */
                Text(userName)
                    .font(.title)
                    .padding(.top, 10)

                Text(userDescription)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                    .frame(width: geometry.size.width - 10)  // Ensure description fits within the available width
            }
        }

    }
}

#Preview {
    ProfileFixView(profileImage: Image(.apple), userName: "Eslam", userDescription: "Developer")
}
