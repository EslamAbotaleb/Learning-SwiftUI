//
//  ApexPredator.swift
//  JPApexPredators
//
//  Created by Eslam on 02/02/2025.
//

import Foundation

struct ApexPredator: Decodable, Identifiable {
    let id: Int
    let name: String
    let type: APType
    let latitude: Double
    let longitude: Double
    let movies: [String]
    let movieScenes: [MovieScene]
    let link: String
    var image: String {
        name.lowercased().replacingOccurrences(of: " ", with: "")
    }
}


