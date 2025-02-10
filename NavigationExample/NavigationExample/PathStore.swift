//
//  PathStore.swift
//  NavigationExample
//
//  Created by Eslam on 09/02/2025.
//

import SwiftUI

class PathStore: ObservableObject {
    @Published var path: NavigationPath {
        didSet {
            save()
        }
    }
    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")
    init() {
        if let data = try? Data(contentsOf: savePath) {
            if let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data) {
                path = NavigationPath(decoded)
                return
            }
        }
        path = NavigationPath()
    }
    func save() {
        do {
            guard let representation = path.codable else { return }
            let data = try JSONEncoder().encode(representation)
            try data.write(to: savePath)
        } catch {
            print("Failed to save navigation data")
        }
    }
}
