//
//  RouterOperations.swift
//  NavigationManagement
//
//  Created by Eslam on 10/02/2025.
//
extension RouterOperations {
    public func navigateBack(_ count: Int = 1) {
        guard count > 0 else { return }
        guard count <= stack.count else {
            stack = .init()
            return
        }
        stack.removeLast(count)
    }
    public func navigateBack(to destination: Destination) {
        //MARK: - Check the destination exists in the stack
        if let index = stack.lastIndex(where: {$0 == destination}) {
            // Remove destination above the specified destination
            stack.truncate(to: index)
        }
    }
    public func navigateToRoot() {
        stack = []
    }
    public func navigate(to destination: Destination) {
        stack.append(destination)
    }

    public func navigate(to destinations: [Destination]) {
        stack += destinations
    }

    public func replace(with destinations: [Destination]) {
        stack = destinations
    }
}
