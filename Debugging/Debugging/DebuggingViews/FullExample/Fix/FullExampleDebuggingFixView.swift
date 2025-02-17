//
//  FullExampleDebuggingFixView.swift
//  Debugging
//
//  Created by Eslam on 17/02/2025.
//

import SwiftUI
struct Item: Identifiable, Hashable {
    var id = UUID()  // A unique identifier for each item
    var name: String
}
struct FullExampleDebuggingFixView: View {
    //    @State private var items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]
    @State private var items = [Item(name: "Item1"), Item(name: "Item2"), Item(name: "New Item")]
    @State private var selectedItem: Item?
    @State private var isLoading = false
    // ItemRow(item: item)
    var body: some View {

        NavigationStack {
            List(items) {
                item in
                NavigationLink(value: item) {
                    ItemRow(item: item)
                        .onChange(of: selectedItem, { oldValue, newValue in
                            let _ = Self._printChanges()
                            self.selectedItem = item
                            withAnimation(.easeInOut(duration: 0.3)) {
                                self.isLoading.toggle()
                            }
                        })
                }
            }
            .navigationDestination(for: Item.self, destination: { item in
                DetailsPageView(item: item)
            })
            .listStyle(PlainListStyle())
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
            self.items.append(Item(name: "New Item"))
        }
    }
}
