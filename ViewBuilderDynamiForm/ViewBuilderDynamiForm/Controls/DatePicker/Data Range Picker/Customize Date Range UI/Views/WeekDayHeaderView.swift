//
//  WeekDayHeaderView.swift
//  ViewBuilderDynamiForm
//
//  Created by Eslam on 04/02/2025.
//

import SwiftUI

struct WeekDayHeaderView: View {
    var manager: CalendarManager
    var weekDays: [String] {
        CalendarOperations.getWeekDayHeaders(calendar: manager.calendar)
    }
    var body: some View {
        HStack(alignment: .center) {
            ForEach(weekDays, id: \.self) {
                weekDay in
                Text(weekDay)
                    .font(manager.font.weekDayHeaderFont)
                    .foregroundStyle(manager.colors.weekDayHeaderColor)
                    .frame(maxWidth: .infinity)
            }
            .background(manager.colors.weekDayHeaderBackColor)
        }

    }
}

#Preview {
    WeekDayHeaderView(manager: CalendarManager())
}
