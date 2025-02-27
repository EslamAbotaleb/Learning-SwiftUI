//
//  ModernApproach.swift
//  ConcurrencyApp
//
//  Created by Eslam on 27/02/2025.
//

import Foundation
class ModernApproach {
    func fetchAPI(name: String, delay: UInt32) async -> String {
        try? await Task.sleep(nanoseconds: UInt64(delay) * 1_000_000_000)
        return "✅ \(name) Done"
    }
    init() {
        Task {
            async let api1 = fetchAPI(name: "API 1", delay: 2)
            async let api2 = fetchAPI(name: "API 2", delay: 3)
            async let api3 = fetchAPI(name: "API 3", delay: 1)

            let results = await [api1, api2, api3]
            print("🚀 All APIs completed! Results: \(results)")
            let result = await randomD6()
            print(result)
            if let data = await fetchNews() {
                print("Downloaded \(data.count) bytes")
            } else {
                print("Download failed.")
            }
            await processWeather()
        }
    }
    func randomD6() async -> Int {
        Int.random(in: 1...6)
    }
    //MARK: - Async await replaced to closure
    func fetchNews() async -> Data? {
        do {
            let url = URL(string: "https://hws.dev/news-1.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            return data
        } catch {
            print("Failed to fetch news")
            return nil
        }
    }

    //MARK: - How to create and call an async function
    func fetchWeatherHistory() async -> [Double] {
        (1...100_000).map { _ in Double.random(in: -10...30)}
    }
    func calculateAverageTemperature(for records: [Double]) async -> Double {
        let total = records.reduce(0, +)
        let average = total / Double(records.count)
        return average
    }
    func upload(result: Double) async -> String {
        "Ok"
    }
    /// Process Weather
    func processWeather() async {
        /*
         let records = await fetchWeatherHistory()
         let average = await calculateAverageTemperature(for: records)
         let response = await upload(result: average)
         print("Server response: \(response)")
         */
        async let records = fetchWeatherHistory()
        let fetchedRecords = await records  // ✅ Await here before using in the next async let

        async let average = calculateAverageTemperature(for: fetchedRecords)
        let calculatedAverage = await average  // ✅ Await here before using in the next async let

        async let response = upload(result: calculatedAverage)

        print("Server response: \(await response)")
    }
}
