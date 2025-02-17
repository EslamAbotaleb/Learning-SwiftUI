//
//  FullExampleDebuggingFixView.swift
//  Debugging
//
//  Created by Eslam on 17/02/2025.
//

import SwiftUI
struct Item: Identifiable {
    var id = UUID()  // A unique identifier for each item
    var name: String
}
struct FullExampleDebuggingFixView: View {
    //    @State private var items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]
    @State private var items = [Item(name: "Item1"), Item(name: "Item2"), Item(name: "New Item")]
    @State private var selectedItem: Item?
    @State private var isLoading = false

    var body: some View {

        NavigationStack {
            List {
                ForEach(items) {
                    item in
                    NavigationLink(destination: DetailsPageView(item: item)) {
                        ZStack {
                            ItemRow(item: item)
                                .listRowSeparator(.hidden)
                        }
                        .listStyle(PlainListStyle())
                        .onTapGesture {
                            self.selectedItem = item
                            let _ = Self._printChanges()
                            withAnimation(.easeInOut(duration: 0.3)) {
                                self.isLoading.toggle()
                            }
                        }
                    }
                }
            }
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
