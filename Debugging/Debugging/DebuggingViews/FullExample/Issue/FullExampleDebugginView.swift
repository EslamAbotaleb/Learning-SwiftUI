//
//  FullExampleDebugginView.swift
//  Debugging
//
//  Created by Eslam on 17/02/2025.
//

import SwiftUI
/*
 Issues in the Code:
 Performance Issues (Animation):

 The shadows and padding might cause performance degradation because List is rendering a lot of views with complex modifiers, especially if the list grows.
 Dynamic updates to the list could cause unnecessary re-renders.
 State Management:

 The isLoading state is being toggled when a row is tapped. But the change in state doesn't effectively trigger the UI change, leading to a potential lag or unresponsive UI behavior.
 Navigation Performance:

 Every tap on an item triggers a navigation push, but the animation might feel delayed due to the asynchronous nature of state changes.
 */
struct FullExampleDebugginView: View {
    @State private var itemsStatic = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]
    @State private var selectedItem: String?
    @State private var isLoading = false

    var body: some View {

        NavigationStack {
            List(itemsStatic, id:\.self) {
                item in
                NavigationLink(destination: DetailsPageIssueView(item: item)) {
                    Text(item)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                        .foregroundColor(.white)
                        .shadow(color: .gray, radius: 10, x: 0, y: 5)
                        .padding(5)
                }
                .onTapGesture {
                    self.selectedItem = item
                    self.isLoading.toggle()
                }
            }
            .onAppear {
                Task {
                    await loadData()
                }
            }
        }
    }

    //MARK: - Simulate some network delay
    func loadData() async {
        try? await Task.sleep(nanoseconds: 2 * 1_000_000_000) // 2 seconds delay
        await MainActor.run {
            self.itemsStatic.append("New Item")
        }
    }
}

#Preview {
    FullExampleDebugginView()
}
