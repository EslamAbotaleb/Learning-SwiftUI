//
//  CustomizeUIDateRange.swift
//  ViewBuilderDynamiForm
//
//  Created by Eslam on 04/02/2025.
//

import SwiftUI

struct CustomizeUIDateRange: View {
    var manager: CalendarManager
    
    var numberOfMonths: Int {
        CalendarOperations.numberOfMonth(manager.minimumDate, manager.maximumDate)
    }

    var body: some View {
        VStack(spacing: 0) {
            WeekDayHeader(manager: manager)
            ScrollViewReader {
                reader in
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack(spacing: 32) {
                        ForEach(0..<numberOfMonths, id: \.self) {
                            index in
                            MonthView(manager: manager, monthOffset: index)
                        }
                    }
                    .padding()
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        if let date = manager.startDate {
                            reader.scrollTo(CalendarOperations.getMonthHeader(date: date), anchor: .center)
                        }
                    }
                }
            }
        }
        .padding(8)
        .background(manager.colors.calendarBackColor)
//        .ignoresSafeArea()
    }
}

#Preview {
    CustomizeUIDateRange(manager: CalendarManager(minimumDate: Date().addingTimeInterval(-60 * 60 * 24 * 30 * 2), maximumDate: Date().addingTimeInterval(60 * 60 * 25 * 30)))
}
