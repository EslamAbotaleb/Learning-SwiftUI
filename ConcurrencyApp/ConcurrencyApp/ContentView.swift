//
//  ContentView.swift
//  ConcurrencyApp
//
//  Created by Eslam on 26/02/2025.
//

import SwiftUI

struct ContentView: View {
    let source = RemoteFile(url: URL(string: "https://hws.dev/inbox.json")!, type: [Message].self)
    @State private var messages = [Message]()

    init() {
        let _ = ModernApproach()
    }
    var body: some View {
        NavigationStack {
            List(messages) { message in
                VStack(alignment: .leading) {
                    Text(message.message)
//                    Text(message.user)
//                        .font(.headline)
//                    Text(message.text)
                }
            }
            .navigationTitle("Inbox")
            .toolbar {
                Button("Refresh", systemImage: "arrow.clockwise", action: refresh)
            }
            .onAppear(perform: refresh)
        }
        /*
         VStack {
         HStack {
         TextField("Website address", text: $site)
         .textFieldStyle(.roundedBorder)
         Button("Go") {
         Task {
         await fetchSource()
         }
         }
         }
         .padding()

         ScrollView {
         Text(sourceCode)
         }
         }
         */
    }
    /* func fetchSource() async {
     do {
     let url = URL(string: site)!
     let (data, _) = try await URLSession.shared.data(from: url)
     sourceCode = String(decoding: data, as: UTF8.self).trimmingCharacters(in: .whitespacesAndNewlines)
     } catch {
     sourceCode = "Failed to fetch \(site)"
     }
     }*/
    func loadData() async {
        async let (userData, _) = URLSession.shared.data(from: URL(string: "https://hws.dev/user-24601.json")!)
        async let (messageData, _) = URLSession.shared.data(from: URL(string: "https://hws.dev/user-messages.json")!)
        do {
            let decoder = JSONDecoder()
            let user = try decoder.decode(User.self, from: await userData)
            let messages = try decoder.decode([Message].self, from: await messageData)
            self.messages = messages
            print("User \(user.name) has \(messages.count) message(s).")
        } catch  {
            print("Sorry, there was a network problem")
        }
    }
    func refresh() {
        Task {
            await loadData()
//            do {
//                messages = try await source.contents ?? []
//            } catch {
//                print("Message update failed.")
//            }
        }
    }
}
#Preview {
    ContentView()
}
