//
//  ContentView.swift
//  DCNetworkingService
//
//  Created by Eslam on 09/02/2025.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var container: DependencyContainer
    var body: some View {
        Button {
            container.networkingService.fetchData { result in
                switch result {
                    case .success(let data):
                        print("Data:\(data)")
                    case .failure(let error):
                        print("Error: \(error)")
                }
            }
        } label: {
            Text("Fetch Data")
        }
    }
}

#Preview {
    ContentView()
}
