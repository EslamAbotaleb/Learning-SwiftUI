//
//  FeaturedLabel.swift
//  ViewModifier
//
//  Created by Eslam on 03/02/2025.
//

import SwiftUI
/*
 struct FeaturedLabel: View {
 var text: String

 var body: some View {
 HStack {
 Image(systemName: "star")
 Text(text)
 }
 .foregroundStyle(.orange)
 .font(.headline)
 }
 }

 #Preview {
 FeaturedLabel(text: "Eslam")
 }
 */
//MARK: - ViewBuilder
struct FeaturedLabel<Content>: View where Content: View {
    //MARK: - Option 1
    @ViewBuilder var content: () -> Content
    @State private var opacity = 0.0

    //MARK: - Option 2
    /*
     let content: Content
     init(@ViewBuilder content: () -> Content) {
       self.content = content()
     }
     */

    var body: some View {
        HStack {
            Image(systemName: "star")
            content()
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

extension FeaturedLabel where Content == Text {
    init(_ text: String) {
        self.init {
            Text(text)
        }
    }
}
