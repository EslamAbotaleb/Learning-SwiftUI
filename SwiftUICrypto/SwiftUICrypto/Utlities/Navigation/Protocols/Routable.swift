//
//  Routable.swift
//  NavigationManagement
//
//  Created by Eslam on 10/02/2025.
//

import SwiftUI
/// `Routable` is a typealias that combines multiple protocols to define requirements for views that can be used within a routing system.
///
/// By conforming to `View` and `Hashable`, types that adopt `Routable` can be rendered within SwiftUI, uniquely identified, and compared for equality.
/// This is crucial for efficiently managing a navigation stack or routing mechanism in a SwiftUI application, enabling type-safe navigation between different views.
///
/// - `View`: Ensures the conforming type can be rendered in the user interface as a SwiftUI view.
/// - `Hashable`: Facilitates the unique identification of routes, which is key for handling collections of views or routes.
///
/// The `Routable` typealias is intended for use in navigation and routing systems, offering a flexible and type-safe method for defining and navigating between different views in a SwiftUI application.
///

public typealias Routable = View & Hashable
