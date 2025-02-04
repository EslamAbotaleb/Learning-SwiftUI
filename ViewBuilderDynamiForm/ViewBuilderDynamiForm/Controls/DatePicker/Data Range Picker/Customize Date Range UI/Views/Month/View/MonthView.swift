//
//  MonthView.swift
//  ViewBuilderDynamiForm
//
//  Created by Eslam on 04/02/2025.
//

import SwiftUI

struct MonthView: View {
    @State var isStartDate = false
    @State var showTime = false
    var manager: CalendarManager
    let monthOffset: Int
    let calendarUnitYMD = Set<Calendar.Component>([.year,.month,.day])

    var monthsArray: [[Date]] {
        monthArray()
    }
    var body: some View {
        Group {
            let header = getMonthHeader()
            VStack(alignment: .leading, spacing: 10) {
                Text(header)
                    .font(manager.font.monthHeaderFont)
                    .foregroundStyle(manager.colors.monthHeaderColor)
                    .padding(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                VStack(alignment: .leading,spacing: 5) {
                    ForEach(monthsArray, id: \.self) {
                        row in
                        HStack(spacing: 0) {
                            ForEach(row, id: \.self) {
                                date in
                                cellView(date)
                            }
                        }
                    }
                }
            }
            .background(manager.colors.monthBackColor)
        }
    }
}

#Preview {
    MonthView(manager: CalendarManager(), monthOffset: 0)
}
