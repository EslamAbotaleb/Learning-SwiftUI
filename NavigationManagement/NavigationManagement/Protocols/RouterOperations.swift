//
//  RouterOperations.swift
//  NavigationManagement
//
//  Created by Eslam on 10/02/2025.
//

import SwiftUI
public protocol RouterOperations: AnyObject {
    associatedtype Destination: Routable
    /// An array representing the current navigation stack of destinations.
    /// Modifying this stack updates the navigation state of the application.
    var stack: [Destination] {get set}

    /// Navigate back in the navigation stack by a specified number of destinations.
    ///
    /// - Parameter count: The number of destinations to navigate back by.
    /// If the count exceeds the number of destinations in the stack, the stack is emptied.
    func navigateBack(_ count: Int)
    /// Navigate back to a specific destination in the stack, removing all destinations that come after it.
    ///
    /// - Parameter destination: The destination to navigate back to.
    /// If the destination does not exist in the stack, no action is taken.
    func navigateBack(to destination: Destination)
    /// Resets the navigation stack to its initial state, effectively navigating to the root destination.
    func navigateToRoot()
    /// Appends a new destination to the navigation stack, moving forward in the navigation flow.
    ///
    /// - Parameter destination: The destination to navigate to.
    func navigate(to destination: Destination)
    /// Appends multiple new destinations to the navigation stack.
    ///
    /// - Parameter destinations: An array of destinations to append to the navigation stack.
    func navigate(to destinations: [Destination])
    /// Replaces the current navigation stack with a new set of destinations.
    ///
    /// - Parameter destinations: An array of new destinations to set as the navigation stack.
    func replace(with destinations: [Destination])
}


