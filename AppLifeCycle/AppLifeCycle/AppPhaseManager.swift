//
//  AppPhaseManager.swift
//  AppLifeCycle
//
//  Created by Eslam on 01/02/2025.
//

import Foundation
final class AppPhaseManager {
    var state: AppPhase  = .none

    public static var instance = AppPhaseManager()
    
    private init() {}

    enum AppPhase {
        case active
        case inactive
        case background
        case none
    }
}
