//
//  ContentView.swift
//  ViewModifier
//
//  Created by Eslam on 03/02/2025.
//

import SwiftUI

struct ContentView: View {
    var modifier: some ViewModifier {
#if DEBUG
        return EmphasizedLayout()
#else
        return EmptyModifier()
#endif
    }
    var applyPadding: Bool
    @State private var isToggleOn = false

    var body: some View {
        
        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//                .modifier(modifier)
            // View-based version:
//                       FeaturedLabel(text: "Hello, world!")
//
//                       // Modifier-based version:
//                       Text("Hello, world!").featured()
            // Using texts:
                        Group {
                            // View-based version:
                            FeaturedLabel("Hello, world!")

                            // Modifier-based version:
                            Text("Hello, world!").featured()
                        }

                        // Using toggles:
                        Group {
                            // View-based version:
                            FeaturedLabel {
                                Toggle("Toggle", isOn: $isToggleOn)
                            }
                            FeaturedLabel {
                                Button("Press") {
                                    print(isToggleOn)
                                }
                            }
                            // Modifier-based version:
                            Toggle("Toggle", isOn: $isToggleOn).featured()
                        }
        }
        

        .padding()
    }
}

#Preview {
    ContentView(applyPadding: false)
}
