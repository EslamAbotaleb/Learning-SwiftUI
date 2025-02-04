//
//  ContentView.swift
//  JPApexPredators
//
//  Created by Eslam on 02/02/2025.
//

import SwiftUI

struct ContentView: View {
    let predators = Predators()

    @State var searchText = ""
    @State var alphabetical = false
    @State var currentSelection = APType.all

    var filterDinos: [ApexPredator] {
        predators.filter(by: currentSelection)
        predators.sort(by: alphabetical)
        return predators.search(for: searchText)
    }
    var body: some View {
        NavigationStack {
            List(filterDinos) {
                predator in
                NavigationLink {
                    //MARK: - Details Page
                    PredatorDetail(predator: predator)
                } label: {
                    HStack {
                        Image(predator.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .shadow(color: .white,radius: 1)
                        VStack(alignment: .leading) {
                            Text(predator.name)
                                .fontWeight(.bold)
                            Text(predator.type.rawValue.capitalized)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.horizontal, 13)
                                .padding(.vertical, 5)
                                .background(predator.type.background)
                                .clipShape(.capsule)
                        }
                    }
                }
                .listRowSeparator(.hidden)
            }
            .navigationTitle("Apex Predators")
            .searchable(text: $searchText)
            .autocorrectionDisabled()
            .animation(.default, value: searchText)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        withAnimation {
                            alphabetical.toggle()
                        }
                    } label: {
                        Image(systemName:  alphabetical
                              ?  "film" : "textformat")
                        .symbolEffect(.bounce, value: alphabetical)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Picker("Picker",
                               selection: $currentSelection.animation()) {
                            ForEach(APType.allCases) {
                                type in
                                Label(type.rawValue.capitalized, systemImage: type.icon)
                            }
                        }

                    } label: {
                        Image(systemName: "slider.horizontal.3")
                    }
                }
            }
            .listStyle(.automatic)
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
