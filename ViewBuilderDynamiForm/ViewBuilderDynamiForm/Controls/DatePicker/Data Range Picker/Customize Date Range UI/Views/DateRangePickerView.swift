//
//  DateRangePickerView.swift
//  ViewBuilderDynamiForm
//
//  Created by Eslam on 03/02/2025.
//

import SwiftUI

struct DateRangePickerView: View {
    var date: Date
    var isDisabled = false
    var isToday = false
    var isSelected = false
    var isBetweenStartAndEnd = false
    var startDate: Date?
    var endDate: Date?
    var manager: CalendarManager
    
    init(date: Date, isDisabled: Bool = false, isToday: Bool = false, isSelected: Bool = false, isBetweenStartAndEnd: Bool = false, startDate: Date? = nil, endDate: Date? = nil, manager: CalendarManager) {
        self.date = date
        self.isDisabled = isDisabled
        self.isToday = isToday
        self.isSelected = isSelected
        self.isBetweenStartAndEnd = isBetweenStartAndEnd
        self.startDate = startDate
        self.endDate = endDate
        self.manager = manager
    }

    var isEndDate: Bool {
        date == endDate
    }
    var isStartDate: Bool {
        date == startDate
    }
    func getText() -> String {
        let day = CalendarOperations.formatDate(date: date)
        return day
    }
    var font: Font {
        var fontWeight = manager.font.cellUnSelectedFont
        if isDisabled {
            fontWeight = manager.font.cellDisabledFont
        } else if isToday {
            fontWeight = manager.font.cellTodayFont
        } else if isBetweenStartAndEnd {
            fontWeight = manager.font.cellFromAndToDateFont
        }
        return fontWeight
    }
    func getTextColor() -> Color {
        var textColor =  manager.colors.textColor
        if isDisabled {
            textColor = manager.colors.disabledColor
        } else if isSelected {
            textColor = manager.colors.selectedColor
        } else if isToday {
            textColor = manager.colors.todayColor
        } else if isBetweenStartAndEnd {
            textColor = manager.colors.betweenStartAndEndDateColor
        }
        return textColor
    }
    func getBackgroundColor() -> Color {
        var backgroundColor = manager.colors.textBackColor
        if isBetweenStartAndEnd {
            backgroundColor = manager.colors.betweenStartAndEndDateColor
        }
        if isDisabled {
            backgroundColor = manager.colors.disabledBackColor
        }
        if isSelected {
            backgroundColor = manager.colors.selectedBackColor
        }
        return backgroundColor
    }
    @State var managera = CalendarManager(calendar: Calendar.current, minimumDate: Date(), maximumDate: Date().addingTimeInterval(60 * 60 * 24 * 365))
    var body: some View {
        VStack {
            CustomizeUIDateRange(manager: manager)
        }
        .padding()
    }
}

//#Preview {
//    DateRangePickerView(date: <#Date#>, manager: <#CalendarManager#>)
//}
