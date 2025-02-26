//
//  Thread.swift
//  ConcurrencyApp
//
//  Created by Eslam on 26/02/2025.
//

import Foundation
class ThreadExample {
    let thread = Thread {
        for i in 1...3 {
            print("Thread running: \(i)")
            sleep(1)
        }
    }
    init() {
        thread.start()
        print("Main thread continues executing...")
    }
}
