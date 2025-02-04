//
//  WeekDayHeader.swift
//  ViewBuilderDynamiForm
//
//  Created by Eslam on 04/02/2025.
//

import SwiftUI

struct WeekDayHeader: View {
    var manager: CalendarManager

    var body: some View {
        VStack(spacing: 8) {
            WeekDayHeaderView(manager: manager)
                .padding(.horizontal)
                .padding(.top)
            Divider()
        }
    }
}

#Preview {
    WeekDayHeader(manager: CalendarManager())
}
