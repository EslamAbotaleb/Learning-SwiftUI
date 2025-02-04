//
//  DateCell.swift
//  ViewBuilderDynamiForm
//
//  Created by Eslam on 04/02/2025.
//

import SwiftUI

struct DateCell: View {
    var calendarDate: DateRangePickerView
    var cellWidth: CGFloat
    var radius: CGFloat {
        calendarDate.isEndDate || calendarDate.isStartDate ? cellWidth / 2 : 0
    }
    var body: some View {
        Text(calendarDate.getText())
            .font(calendarDate.font)
            .foregroundStyle(calendarDate.getTextColor())
            .frame(maxWidth: .infinity, alignment: .center)
            .frame(height: cellWidth)
            .font(.system(size: 20))
            .background(calendarDate.getBackgroundColor())
            .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}
#Preview {
    Group {
        DateCell(calendarDate: DateRangePickerView(date: Date(), isDisabled: false, isToday: false, isSelected:  false, isBetweenStartAndEnd: false,manager: CalendarManager()), cellWidth: 32)
            .frame(width: 32, height: 32)
    }
}
