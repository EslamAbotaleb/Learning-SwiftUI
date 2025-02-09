//
//  User.swift
//  Networking
//
//  Created by Eslam on 09/02/2025.
//

import Foundation
struct User: Identifiable, Decodable {
    var id: Int
    var name: String
    var email: String
}
