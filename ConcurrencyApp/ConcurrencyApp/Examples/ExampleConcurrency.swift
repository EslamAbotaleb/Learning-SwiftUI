//
//  ExampleConcurrency.swift
//  ConcurrencyApp
//
//  Created by Eslam on 26/02/2025.
//

import Foundation
import Dispatch

class ConcurrencyExample {
    //    let queue = DispatchQueue(label:"com.gcd.queue", attributes: .concurrent, target: .global(qos: .userInitiated))
    let queue = DispatchQueue(label:"com.gcd.queue", attributes: .concurrent, target: .global(qos: .userInitiated))

    let concurrentQueue = DispatchQueue.global(qos: .background) // Uses thread pool
    let semaphore = DispatchSemaphore(value: 3)
    //    private let concurrentQueue = DispatchQueue(label: "com.gcd.dispatchBarrierQueue", attributes: .concurrent)
    //MARK: - DispatchWorkItem
    /*
     let queue = DispatchQueue(label: "com.swiftpal.dispatch.workItem")

     let workItem = DispatchWorkItem() {
     print("Stored Task")
     }
     init() {
     //MARK: - TASK 1
     queue.async(execute: workItem)
     //MARK: - TASK 2
     queue.asyncAfter(deadline: .now() + 1, execute: workItem)
     //MARK: - Work Item Cancel
     workItem.cancel()
     //MARK: - TASK 3
     queue.async(execute: workItem)

     if workItem.isCancelled {
     print("Task was cancelled")
     }
     }
     */
    //MARK: - Dispatch Barrier
    /*
     init() {
     for value in 1...5 {
     concurrentQueue.async {
     print("Async Task \(value)")
     }
     }
     for value in 6...10 {
     concurrentQueue.async(flags: .barrier) {
     print("Barrier Task \(value)")
     }
     }
     for value in 11...15 {
     concurrentQueue.async {
     print("Sync \(value)")
     }
     }
     }
     */
    init() {
        /*
        self.semaphore.wait()
        for i in 0..<12 {
                    let movieNumber = i + 1
                    print("Downloading movie", movieNumber)
                    sleep(2)
                    print("Downloaded movie", movieNumber)
        }
        self.semaphore.signal()
         */
        for i in 1...5 {
            concurrentQueue.async {
                print("Task \(i) is running on thread: \(Thread.current)")
                sleep(2)
                print("Task\(i) finished")
            }
        }
        sleep(6)
        print("All tasks completed")
    }
}
/*
 Failed to send CA Event for app launch measurements for ca_event_type: 0 event_name: com.apple.app_launch_measurement.FirstFramePresentationMetric

 */
