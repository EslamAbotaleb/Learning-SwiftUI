//
//  DebuggingDataFlowIssue.swift
//  Debugging
//
//  Created by Eslam on 18/02/2025.
//

import SwiftUI
import os

struct DebuggingDataFlowIssue: View {
    @State private var counter = 0
    
    let log = Logger()
    var body: some View {
        VStack {
            Text("Counter: \(counter)")
//                .onChange(of: counter) { oldValue, newValue in
//
//                    log.log("OldValue: \(oldValue) NewValue: \(newValue)")
//                    /*
//                     onChange(of: Int) action tried to update multiple times per frame.
//                     /// this error mean due to the modification of the observed value in onChange
//                     like counter = oldValue + newValue
//                     */
//                }

//                .task(id: counter) {
//                    counter -= 2
//                    log.log("Counter Task is: \(counter)")
//                }
            Button("Increment") {
                counter += 1
                log.log("Counter updated to: \(counter)")
            }
        }
    }
}

#Preview {
    DebuggingDataFlowIssue()
}
extension Binding {
    func conditionSet(_ condition: @escaping (Value) -> Bool) -> Binding<Value> {
        Binding(get: { wrappedValue },
                set: { newValue in
                    if condition(newValue) {
                        self.wrappedValue = newValue
                    }
                })
    }
}
