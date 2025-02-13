//
//  RouterViewModel.swift
//  NavigationManagement
//
//  Created by Eslam on 10/02/2025.
//

import SwiftUI

public final class RouterViewModel<Routes: Routable>: RouterOperations, ObservableObject {
    public typealias Destination = Routes
    @Published public var stack: [Routes] = []
    public init () { }
}
