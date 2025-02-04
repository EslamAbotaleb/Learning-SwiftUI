//
//  MonthViewExtenstion.swift
//  ViewBuilderDynamiForm
//
//  Created by Eslam on 04/02/2025.
//

import SwiftUI

extension MonthView {
    func isThisMonth(date: Date) -> Bool {
        return manager.calendar.isDate(date, equalTo: firstOfMonthForOffset(), toGranularity: .month)
    }
    func firstDateMonth() -> Date {
        var components = manager.calendar.dateComponents(calendarUnitYMD, from: manager.minimumDate)
        components.day = 1
        return manager.calendar.date(from: components) ?? Date()
    }
    func firstOfMonthForOffset() -> Date {
        var offset = DateComponents()
        offset.month = monthOffset
        return manager.calendar.date(byAdding: offset, to: firstDateMonth())!
    }
    func formatDate(date: Date) -> Date {
        let components = manager.calendar.dateComponents(calendarUnitYMD, from: date)
        return manager.calendar.date(from: components) ?? Date()
    }
    func formatAndCompareDate(date: Date, referenceDate: Date) -> Bool {
        let refDate = formatDate(date: referenceDate)
        let clampedDate = formatDate(date: date)
        return refDate == clampedDate
    }
    ///offset for to know this number day for which day
    func numberOfDays(offset: Int) -> Int {
        let firstOfMonth = firstOfMonthForOffset()
        let rangeOfWeeks = manager.calendar.range(of: .weekOfMonth, in: .month, for: firstOfMonth)
        return (rangeOfWeeks?.count)! * daysPerWeek
    }
    func isStartDate(date: Date) -> Bool {
        if manager.startDate == nil {
            return false
        } else {
            return formatAndCompareDate(date: date, referenceDate: manager.startDate ?? Date())
        }
    }
    func isEndDate(date: Date) -> Bool {
        if manager.endDate == nil {
            return false
        }
        return formatAndCompareDate(date: date, referenceDate: manager.endDate ?? Date())
    }
    func isBetweenStartAndEnd(date: Date) -> Bool {
        if manager.startDate == nil {
            return false
        } else if manager.endDate == nil {
            return false
        } else if manager.calendar.compare(date, to: manager.startDate ?? Date(), toGranularity: .day) == .orderedAscending {
            return false
        } else if manager.calendar.compare(date, to: manager.endDate ?? Date(), toGranularity: .day) == .orderedDescending {
            return false
        }
        return true
    }
    func isEnabled(date: Date) -> Bool {
        let clampedDate = formatDate(date: date)
        if manager.calendar.compare(clampedDate, to: manager.minimumDate, toGranularity: .day) == .orderedDescending {
            return false
        }
        return !isOnOfDisabledDates(date: date)
    }
    func isOnOfDisabledDates(date: Date) -> Bool {
        self.manager.disabledDatesContains(date: date)
    }
    func isStartDateAfterEndDate() -> Bool {
        if manager.startDate == nil {
            return false
        } else if manager.endDate == nil {
            return false
        } else if manager.calendar.compare(manager.endDate ?? Date(), to: manager.startDate ?? Date(), toGranularity: .day) == .orderedDescending {
            return false
        }
        return true
    }
    func isToday(date: Date) -> Bool {
        return formatAndCompareDate(date: date, referenceDate: Date())
    }
    func isSpecialDate(date: Date) -> Bool {
        return isSelectedDate(date: date) || isStartDate(date: date) || isEndDate(date: date)
    }
    func isSelectedDate(date: Date) -> Bool {
        if manager.selectedDate == nil {
            return false
        }
        return formatAndCompareDate(date: date, referenceDate: manager.selectedDate ?? Date())
    }
    func dateTapped(date: Date) {
        if self.isEnabled(date: date) {
            if isStartDate {
                self.manager.startDate = date
                self.manager.endDate = nil
                isStartDate = false
            } else {
                self.manager.endDate = date
                if self.isStartDateAfterEndDate() {
                    self.manager.endDate = nil
                    self.manager.startDate = nil
                }
                isStartDate = true
            }
        }
    }
    func getDateAtIndex(index: Int) -> Date {
        let firstOfMonth = firstOfMonthForOffset()
        let weekDay = manager.calendar.component(.weekday, from: firstOfMonth)
        var startOffset = weekDay - manager.calendar.firstWeekday
        startOffset += startOffset >= 0 ? 0 : daysPerWeek
        var dateComponents = DateComponents()
        dateComponents.day = index - startOffset

        return manager.calendar.date(byAdding: dateComponents, to: firstOfMonth) ?? Date()
    }
    func monthArray() -> [[Date]] {
        var rowArray = [[Date]()]
        for row in 0..<(numberOfDays(offset: monthOffset) / 7) {
            var columnArray = [Date]()
            for column in 0...6 {
                let abc = self.getDateAtIndex(index: (row * 7) + column)
                columnArray.append(abc)
            }
            rowArray.append(columnArray)
        }
        return rowArray
    }
    func getMonthHeader() -> String {
        CalendarOperations.getMonthHeader(date: firstOfMonthForOffset())
    }
}

extension MonthView {
    func cellView(_ date: Date) -> some View {
        HStack(spacing: 0) {
            if self.isThisMonth(date: date) {
                DateCell(calendarDate: DateRangePickerView(
                    date: date,
                    isDisabled: !isEnabled(date: date),
                    isToday: isToday(date: date),
                    isSelected: isSpecialDate(date: date),
                    isBetweenStartAndEnd: isBetweenStartAndEnd(date: date),
                    startDate: manager.startDate,
                    endDate: manager.endDate,
                    manager: manager)
                         , cellWidth: cellWidth)
                .onTapGesture {
                    self.dateTapped(date: date)
                }
            } else {
                Text("")
                    .frame(maxWidth: .infinity, alignment: .center)
            }
        }
    }
}
