//
//  ContentView.swift
//  Debugging
//
//  Created by Eslam on 17/02/2025.
//

import SwiftUI

struct ContentView: View {
    @State var name = "Kamyar"
    @State var age = 8
    @State var firstName = ""
    var body: some View {
#if DEBUG
        /// Must there interact change happen in view once there change will happen 
        let _ = Self._printChanges()
#endif

        VStack {
            TextField("First Name", text: $firstName)
            Text(name)
            
            Text("\(age)")
            Button("Change Name") {
                name = firstName
            }
            Button("Change Age") {
                age += 1
            }
        }
    }
}

#Preview {
    ContentView()
}
