//
//  Message.swift
//  ConcurrencyApp
//
//  Created by Eslam on 27/02/2025.
//



struct Message: Decodable, Identifiable {
    let id: Int
    let from: String
    let message: String
}
