//
//  User.swift
//  ConcurrencyApp
//
//  Created by Eslam on 27/02/2025.
//
import Foundation
struct User: Decodable, Identifiable {
    let id: UUID
    let name: String
    let age: Int
}
