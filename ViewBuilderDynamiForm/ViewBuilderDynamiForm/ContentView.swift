//
//  ContentView.swift
//  ViewBuilderDynamiForm
//
//  Created by Eslam on 03/02/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                ControlFormBuilderView(titleControl: "Date Picker") {
                    DataPickerView()
                }
            }
            .navigationTitle("Dynamic Form")
        }
    }
}

#Preview {
    ContentView()
}
