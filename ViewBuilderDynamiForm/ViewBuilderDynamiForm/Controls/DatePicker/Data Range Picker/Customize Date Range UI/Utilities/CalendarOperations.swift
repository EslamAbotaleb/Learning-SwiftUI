//
//  CalendarOperations.swift
//  ViewBuilderDynamiForm
//
//  Created by Eslam on 04/02/2025.
//

import Foundation
class CalendarOperations {
    //MARK: - Week header
    static func getWeekDayHeaders(calendar: Calendar) -> [String] {
        let weekDays = calendar.shortStandaloneWeekdaySymbols
        let firstWeekDayIndex = calendar.firstWeekday - 1
        let adjustedWeekDays = Array(weekDays[firstWeekDayIndex...] + weekDays[..<firstWeekDayIndex])
        return adjustedWeekDays
    }
    //MARK: - Format
    static func formatDate(date: Date) -> String {
        return date.formatted(.dateTime.day())
    }
    //MARK: - Convert
    static func convertDateToString(date: Date) -> String {
        return date.formatted()
    }
    //MARK: - Month
    static func getMonthDayFromDate(date: Date) -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.month], from: date)
        guard let month = components.month else {
            return 0
        }
        return month - 1
    }
    static func getMonthHeader(date: Date) -> String {
        let dateStyle = Date.FormatStyle()
            .year(.defaultDigits)
            .month(.wide)
        return date.formatted(dateStyle)
    }
    static func numberOfMonth(_ minDate: Date, _ maxDate: Date) -> Int {
        let components = Calendar.current.dateComponents([.month], from: minDate, to: maxDate)
        guard let month = components.month else {
            return 0
        }
        return month + 1
    }
    static func getLastDayOfMonth(date: Date, calendar: Calendar = .current) -> Date {
        var components = calendar.dateComponents([.year, .month], from: date)
        components.setValue(1, for: .day)
        guard let startOfMonth = calendar.date(from: components) else {
            fatalError("Invalid Date Components")
        }
        return calendar.date(byAdding: .month, value: 1, to: startOfMonth)?.addingTimeInterval(-86500) ?? startOfMonth
    }
}
