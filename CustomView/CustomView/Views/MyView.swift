//
//  MyView.swift
//  CustomView
//
//  Created by Eslam on 03/02/2025.
//

import SwiftUI

struct AlertView<Content: View>: View {
    let content: Content
    let cancelAction: ()->Void
    let confirmAction: ()->Void

    init(@ViewBuilder content: () -> Content, cancel: @escaping ()->Void,confirm:@escaping ()->Void) {
        self.content = content()
        self.cancelAction = cancel
        self.confirmAction = confirm
    }
    var body: some View {
        VStack {
            content
                .padding()
            Divider()
            HStack {
                Button {
                    cancelAction()
                } label: {
                    Text("Cancel")
                }
                .foregroundStyle(.green)
                Spacer()
                Button {
                    confirmAction()
                } label: {
                    Text("Confirm")
                }
                .foregroundStyle(.yellow)
            }
        }
        .frame(width: UIScreen.main.bounds.size.width / 2)
        .foregroundStyle(.red)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding()
    }
}

struct MyCustomViewBuilder: View {
    //MARK: - First option i must add annotation @ViewBuilder in case will will not add closure
    @ViewBuilder
    func buildContent() -> some View {
        Text("Eslam")
    }

    //MARK: - Option 2 without add annotation to function i can add generic content view<>
    /// then add closure @ViewBuilder menuItems: () -> MenuItems
    func customContextMenu<MenuItems: View>(
        @ViewBuilder menuItems: () -> MenuItems
    ) -> some View {
        menuItems()
    }
    var body: some View {
        buildContent()
    }
}
