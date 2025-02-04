//
//  Calendar.swift
//  ViewBuilderDynamiForm
//
//  Created by Eslam on 04/02/2025.
//

import Foundation
extension Calendar {
    func daysOfMonth(for date: Date) -> [Date] {
        guard let range = self.range(of: .day, in: .month, for: date) else {
            return [] // Handle cases where the range cannot be determined
        }

        return range.compactMap { day in
            self.date(bySettingHour: 0, minute: 0, second: 0, of: self.date(byAdding: .day, value: day - 1, to: self.startOfDay(for: date)) ?? Date())
        }
    }

    // More efficient version (avoids repeated calendar calls within the loop)
    func daysOfMonthEfficient(for date: Date) -> [Date] {
        let components = self.dateComponents([.year, .month], from: date)
        guard let firstDayOfMonth = self.date(from: components),
              let range = self.range(of: .day, in: .month, for: firstDayOfMonth) else {
            return []
        }

        let days = (range.lowerBound ..< range.upperBound).map { day in
            self.date(byAdding: .day, value: day - 1, to: firstDayOfMonth)! // Force-unwrapping is safe here
        }
        return days
    }


    // Another version, using dateComponents and a while loop (more explicit)
    func daysOfMonthWhileLoop(for date: Date) -> [Date] {
        let components = self.dateComponents([.year, .month], from: date)
        guard let firstDayOfMonth = self.date(from: components) else { return [] }

        var days: [Date] = []
        var currentDate = firstDayOfMonth

        while self.component(.month, from: currentDate) == self.component(.month, from: date) {
            days.append(currentDate)
            guard let nextDay = self.date(byAdding: .day, value: 1, to: currentDate) else { break }
            currentDate = nextDay
        }
        return days
    }
}
