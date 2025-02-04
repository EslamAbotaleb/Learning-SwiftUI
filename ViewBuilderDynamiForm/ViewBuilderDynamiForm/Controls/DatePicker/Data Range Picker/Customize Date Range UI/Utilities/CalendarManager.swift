//
//  CalendarManager.swift
//  ViewBuilderDynamiForm
//
//  Created by Eslam on 04/02/2025.
//

import Foundation
@Observable
class CalendarManager {
    var selectedDate: Date? = nil
    var startDate: Date? = nil
    var endDate: Date? = nil
    var calendar = Calendar.current
    var minimumDate = Date()
    var maximumDate = Date()
    var disabledDates: [Date]
    var disabledAfterDate: Date?
    var colors = ColorDateRangePicker()
    var font = FontCalendar()

    init(selectedDate: Date? = nil, startDate: Date? = nil, endDate: Date? = nil, calendar: Foundation.Calendar = Calendar.current, minimumDate: Date = Date(), maximumDate: Date = Date(), disabledDates: [Date] = [], disabledAfterDate: Date? = nil, colors: ColorDateRangePicker = ColorDateRangePicker(), font: FontCalendar = FontCalendar()) {
        self.selectedDate = selectedDate
        self.startDate = startDate
        self.endDate = endDate
        self.calendar = calendar
        self.minimumDate = minimumDate
        self.maximumDate = maximumDate
        self.disabledDates = disabledDates
        self.disabledAfterDate = disabledAfterDate
        self.colors = colors
        self.font = font
    }

    func disabledDatesContains(date: Date) -> Bool {
        if let disabledAfterDate = disabledAfterDate, date > disabledAfterDate {
            return true
        } else {
            return disabledDates.contains {
                calendar.isDate($0, inSameDayAs: date)
            }
        }
    }
    //MARK: - Month
    func monthHeader(monthOffset: Int) -> String {
        if let date = firstOfMonthForOffset(monthOffset) {
            return CalendarOperations.getMonthHeader(date: date)
        }
        return ""
    }
    func firstOfMonthForOffset(_ offset: Int) -> Date? {
        var offsetComponent = DateComponents()
        offsetComponent.month = offset
        return calendar.date(byAdding: offsetComponent, to: firstDateMonth())
    }
    func firstDateMonth() -> Date {
        var components = calendar.dateComponents([.year, .month, .day], from: minimumDate)
        components.day = 1
        return calendar.date(from: components) ?? Date()
    }

}
