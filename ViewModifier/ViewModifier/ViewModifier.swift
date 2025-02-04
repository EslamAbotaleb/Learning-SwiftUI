//
//  ViewModifier.swift
//  ViewModifier
//
//  Created by Eslam on 03/02/2025.
//

import SwiftUI

struct EmptyStateViewModifier<EmptyContent>: ViewModifier where  EmptyContent: View {
    let isEmpty: Bool
    let emptyContent: () -> EmptyContent
    func body(content: Content) -> some View {
        if isEmpty {
            emptyContent()
        }
        else {
            content
        }
    }
}
struct FeaturedModifier: ViewModifier {
    @State private var opacity = 0.0
    func body(content: Content) -> some View {
        HStack {
                    Image(systemName: "star")
                    content
                }
                .foregroundColor(.orange)
                .font(.headline)
                .opacity(opacity)
        .onAppear {
            withAnimation {
                opacity = 1
            }
        }
    }
}
/*
protocol ImageModifier {
    /// `Body` is derived from `View`
    associatedtype Body : View

    /// Modify an image by applying any modifications into `some View`
    func body(image: Image) -> Self.Body
}

extension Image {
    func modifier<M>(_ modifier: M) -> some View where M: ImageModifier {
        modifier.body(image: self)
    }
}
 */
/*
struct MyImageModifier: ImageModifier {
    func body(image: Image) -> some View {
        image.resizable().scaledToFit()
    }
}
 */
extension View {
    func emptyState<EmptyContent>(_ isEmpty: Bool, emptyContent: @escaping () -> EmptyContent) -> some View where EmptyContent: View {
        modifier(EmptyStateViewModifier(isEmpty: isEmpty, emptyContent: emptyContent))
    }
}
//extension View {
//    func featured() -> some View {
//        HStack {
//            Image(systemName: "star")
//            self
//        }
//        .foregroundStyle(.orange)
//        .font(.headline)
//    }
//}
extension View {
    func featured() -> some View {
        modifier(FeaturedModifier())
    }
}
