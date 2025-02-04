//
//  MovieScene.swift
//  JPApexPredators
//
//  Created by Eslam on 02/02/2025.
//
import SwiftUI

enum APType: String, Decodable, CaseIterable, Identifiable {
    case all
    case land
    case air
    case sea

    var id: APType {
        self
    }
    var background: Color {
        switch self {
            case .land:
                    .brown
            case .air:
                    .teal
            case .sea:
                    .blue
            case .all:
                    .black
        }
    }
    var icon: String {
        switch self {
            case .all:
                "square.stack.3d.up.fill"
            case .land:
                "leaf.fill"
            case .air:
                "wind"
            case .sea:
                "drop.fill"
        }
    }
}
struct MovieScene: Decodable, Identifiable {
    let id: Int
    let movie: String
    let sceneDescription: String
}
