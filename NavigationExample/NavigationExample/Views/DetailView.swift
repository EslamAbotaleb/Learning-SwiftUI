//
//  DetailView.swift
//  NavigationExample
//
//  Created by Eslam on 09/02/2025.
//

import SwiftUI

struct DetailView: View {
//    @Binding var path: [Int]
//    var number: Int
//    init(number: Int) {
//        self.number = number
//        print("Creating detail view \(number)")
//    }
//    var body: some View {
//        Text("Detail View \(number)")
//    }
    var number: Int

     var body: some View {
         NavigationLink("Go to Random Number", value: Int.random(in: 1...1000))
             .navigationTitle("Number: \(number)")
//         NavigationLink("Go to Random Number", value: Int.random(in: 1...1000))
//             .navigationTitle("Number: \(number)")
//             .toolbar {
//                 Button("Home") {
//                     path.removeAll()
//                 }
//             }
     }
}

//#Preview {
//    DetailView(path: <#Binding<[Int]>#>, number: 1)
//}
