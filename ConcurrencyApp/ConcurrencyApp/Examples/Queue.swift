//
//  Queue.swift
//  ConcurrencyApp
//
//  Created by Eslam on 26/02/2025.
//
import Foundation
class QueueExample {
    //MARK: - This url contain like reference for concurrency
    //https://chatgpt.com/share/67bf6a5e-e2c0-800d-8cef-cd9924e24163
    //MARK: - Serial Queue
    let serialQueue = DispatchQueue(label: "com.example.serialQueue")
    /*
     init() {
     serialQueue.async {
     print("Task 1 started")
     sleep(2)
     print("Task 1 finished")
     }
     serialQueue.async {
     print("Task 2 started")
     sleep(1)
     print("Task 2 finished")
     }
     serialQueue.async {
     print("Task 3 started")
     sleep(3)
     print("Task 3 finished")
     }
     print("Main thread continues")
     }
     */

    //MARK: - Concurrent Queue
    /*
     let concurrentQueue = DispatchQueue(label: "com.example.concurrentQueue", attributes: .concurrent)

     init() {
     concurrentQueue.async {
     print("Task 1 started")
     sleep(2)
     print("Task 1 finished")
     }
     concurrentQueue.async {
     print("Task 2 started")
     sleep(1)
     print("Task 2 finished")
     }
     concurrentQueue.async {
     print("Task 3 started")
     sleep(3)
     print("Task 3 finished")
     }
     print("Main thread continues")
     }*/

    //MARK: - Global Queues
    /// User Interactive (higher)
    /// User Initiated
    /// Default
    /// Utility
    /// background
    /// UnSpecified (lowest)
    /*
     init() {
     DispatchQueue.global(qos: .default).async {
     print("🌟 Default QoS Task Started")
     sleep(2)
     print("✅ Default QoS Task Completed")
     }
     DispatchQueue.global(qos: .userInitiated).async {
     print("Downloading large file")
     sleep(3)
     print("Download complete")
     }
     DispatchQueue.global(qos: .background).async {
     print("Logging data in background...")
     sleep(2)
     print("Logging complete")
     }
     DispatchQueue.global(qos: .utility).async {
     print("🟦 Utility Task Started (Downloading Data...)")
     sleep(4) // Simulating a long-running task
     print("✅ Utility Task Completed (Download Finished)")
     }
     DispatchQueue.global(qos: .userInteractive).async {
     print("🔴 User Interactive Task (Highest Priority)")
     }

     DispatchQueue.global(qos: .userInitiated).async {
     print("🟠 User Initiated Task (High Priority)")
     }

     DispatchQueue.global(qos: .default).async {
     print("🟡 Default Task (Medium Priority)")
     }

     DispatchQueue.global(qos: .utility).async {
     print("🔵 Utility Task (Low Priority)")
     }

     DispatchQueue.global(qos: .background).async {
     print("⚫ Background Task (Lowest Priority)")
     }

     print("Main thread is free to do other tasks")
     }
     */
    //MARK: - Main Queue
    /*
     init() {
     DispatchQueue.global().async {
     let data = "Fetched Data"
     sleep(2)
     DispatchQueue.main.async {
     print("Updating UI with \(data)")
     }
     }
     print("Main thread continues execution...")
     }
     */
    //MARK: - Dispatch Barrier
    /*
     let concurrentQueue = DispatchQueue(label: "com.example.concurrent", attributes: .concurrent)
     var sharedResource = 0

     init() {
     concurrentQueue.async {
     print("Read 1: \(self.sharedResource)")
     }
     concurrentQueue.async {
     print("Read 2: \(self.sharedResource)")
     }

     // Write operation (Executed exclusively)
     concurrentQueue.async(flags: .barrier) {
     print("Writing to shared resource")
     self.sharedResource = 100
     }
     concurrentQueue.async {
     print("Read 3: \(self.sharedResource)")
     }
     concurrentQueue.async {
     print("Read 4: \(self.sharedResource)")
     }
     concurrentQueue.async {
     for value in 1...5 {
     print("TASK I — async \(value)")
     }
     }

     concurrentQueue.async {
     for value in 6...10 {
     print("TASK II — async \(value)") // Changed "sync" to "async" to match async execution
     }
     }

     for value in 11...15 {
     concurrentQueue.async(flags: .barrier) {
     print("TASK III — barrier \(value)")
     }
     }

     concurrentQueue.async {
     for value in 16...20 {
     print("TASK IV — async \(value)") // Fixed the task numbering
     }
     }
     }
     */
    //MARK: - Dispatch Group
    let group = DispatchGroup()
    let queue = DispatchQueue.global()
    /*
     init() {
     queue.async(group: group) {
     sleep(2)
     print("Task 1 completed")
     }
     queue.async(group: group) {
     sleep(3)
     print("Task 2 completed")
     }
     queue.async(group: group) {
     sleep(1)
     print("Task 3 completed")
     }

     group.notify(queue: DispatchQueue.main) {
     print("All tasks completed, updating UI...")
     }
     }
     */
    /*
     let dispatchGroup = DispatchGroup()
     func fetchAPIOne() {
     dispatchGroup.enter()
     DispatchQueue.global().async {
     print("🌍 Fetching API 1")
     sleep(2) // Simulating API call
     print("✅ API 1 Done")
     self.dispatchGroup.leave()
     }
     }
     func fetchAPI2() {
     dispatchGroup.enter()
     DispatchQueue.global().async {
     print("🌍 Fetching API 2")
     sleep(3) // Simulating API call
     print("✅ API 2 Done")
     self.dispatchGroup.leave()
     }
     }
     func fetchAPI(name: String, delay: UInt32) async -> String {
     try? await Task.sleep(nanoseconds: UInt64(delay) * 1_000_000_000)
     return "✅ \(name) Done"
     }
     init() {
     fetchAPIOne()
     fetchAPI2()
     dispatchGroup.notify(queue: .main) {
     print("🚀 All APIs completed! UI can now load.")
     }
     print("Main thread continues execution") // This will run first
     Task {
     async let api1 = fetchAPI(name: "API 1", delay: 2)
     async let api2 = fetchAPI(name: "API 2", delay: 3)
     async let api3 = fetchAPI(name: "API 3", delay: 1)

     let results = await [api1, api2, api3]
     print("🚀 All APIs completed! Results: \(results)")
     }
     }
     */
    //MARK: - DispatchWorkItem
    /*
     Canceling a Task Before Execution
     Example: Delaying a network request but canceling if the user cancels a search.
     Modifying the Task Dynamically
     Example: Updating a task before execution (e.g., changing its priority).
     Waiting for Completion
     Example: Running a task and waiting for it to finish before continuing.
     Reusing a Work Item
     Example: Using the same work item multiple times.
     */
    /*
     var workItem: DispatchWorkItem?
     func performSearch() {
     // Cancel the previous task if still running
     workItem?.cancel()
     workItem = DispatchWorkItem {
     print("🔍 Performing Search")
     }
     DispatchQueue.global().asyncAfter(deadline: .now() + 0.5, execute: workItem!)
     }
     var searchTask: DispatchWorkItem?
     func performSearch(query: String) {
     searchTask?.cancel() // Cancel the previous task if still running

     searchTask = DispatchWorkItem {
     print("🔍 Searching for: \(query)")
     sleep(1) // Simulate API call
     print("✅ Results for: \(query)")
     }

     DispatchQueue.global(qos: .userInitiated).asyncAfter(deadline: .now() + 0.5, execute: searchTask!)
     }
     init() {

     // Calling search multiple times before execution
     performSearch()
     performSearch() // Cancels the previous one
     performSearch() // Only this one runs
     //////////
     //Simulating user typing
     performSearch(query: "S")
     performSearch(query: "Sw")
     performSearch(query: "Swi")
     performSearch(query: "Swift") // Only this call will execute
     }
     */
    //MARK: - Semaphore
    let concurrentQueue = DispatchQueue(label: "com.example.concurrentQueue", attributes: .concurrent)
    let semaphore = DispatchSemaphore(value: 3) // Allows one task at a time
    /*
     init() {
     concurrentQueue.async {
     self.semaphore.wait() // Decrement semaphore (wait)
     for value in 1...5 {
     print("TASK I — async \(value)")
     }
     self.semaphore.signal() // Increment semaphore (release)
     }
     concurrentQueue.async {
     self.semaphore.wait()
     for value in 6...10 {
     print("TASK II — async \(value)")
     }
     self.semaphore.signal()
     }
     for value in 11...15 {
     concurrentQueue.async(flags: .barrier) {
     self.semaphore.wait()
     print("TASK III — barrier \(value)")
     self.semaphore.signal()
     }
     }
     concurrentQueue.async {
     self.semaphore.wait()
     for value in 16...20 {
     print("TASK IV — async \(value)")
     }
     self.semaphore.signal()
     }
     }
     */
    /*
     let semaphore2 = DispatchSemaphore(value: 1)
     let queueGlobal = DispatchQueue.global(qos: .userInitiated)
     init() {

     for i in 1...5 {
     let workItem = DispatchWorkItem(qos: .userInitiated) {
     self.semaphore2.wait() // Decrease count (if 0, it waits)
     print("🔵 Starting Task \(i)")
     sleep(2) // Simulate a network request
     print("🟢 Finished Task \(i)")
     self.semaphore2.signal() // Increase count (release one slot)
     }
     queueGlobal.async(execute: workItem)
     }

     }
     */
    //MARK: - OperationQueue
    /*
     When to Use OperationQueue?
     Limit Concurrent Tasks → Set maxConcurrentOperationCount to control how many tasks run simultaneously.
     Task Dependencies → Ensure one task runs only after another completes.
     Cancel & Pause Tasks → Easily cancel, suspend, or resume operations.
     Better Priority Management → Set different priorities for tasks (.veryLow, .normal, .veryHigh).
     Automatic Thread Management → It handles scheduling without blocking the main thread.
     */
    init() {
        let operationQueue = OperationQueue()
        operationQueue.qualityOfService = .userInitiated
        operationQueue.maxConcurrentOperationCount = 2 // Limits concurrency

        for i in 1...5 {
            operationQueue.addOperation {
                print("🔵 Task \(i) started")
                sleep(2) // Simulate work
                print("🟢 Task \(i) completed")
            }
        }
    }
}
