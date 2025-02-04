//
//  Predator.swift
//  JPApexPredators
//
//  Created by Eslam on 02/02/2025.
//

import Foundation

class Predators {
    var apexPredators: [ApexPredator] = []
    var allApexPredators: [ApexPredator] = []


    init() {
        decodeApexPredatorData()
    }
    func decodeApexPredatorData() {
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                allApexPredators = try decoder.decode([ApexPredator].self, from: data)
                apexPredators = allApexPredators
            } catch {
                print("Error decoding JSON data: \(error)")
            }
        }
    }
    func search(for searchTerm: String) -> [ApexPredator] {
        if !searchTerm.isEmpty {
            return apexPredators.filter {
                $0.name.localizedCaseInsensitiveContains(searchTerm)
            }
        } else {
            return apexPredators
        }
    }
    func sort(by alphabetical: Bool) {
        apexPredators.sort {
            predator1, predator2 in
            if alphabetical {
                predator1.name < predator2.name
            } else {
                predator1.id < predator2.id
            }
        }
    }
    func filter(by type: APType) {
        if type == .all {
            apexPredators = allApexPredators
        } else {
            apexPredators = allApexPredators.filter {
                predator in
                predator.type == type
            }
        }
    }
}

