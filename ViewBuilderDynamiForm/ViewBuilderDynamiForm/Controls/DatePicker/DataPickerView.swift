//
//  DataPickerView.swift
//  ViewBuilderDynamiForm
//
//  Created by Eslam on 03/02/2025.
//

import SwiftUI

struct DataPickerView: View {
    @State var multiRangePicker: Bool = false
    @State var manager = CalendarManager(calendar: Calendar.current, minimumDate: Date(), maximumDate: Date().addingTimeInterval(60 * 60 * 24 * 365))

    var body: some View {
        VStack {
            if multiRangePicker == true {
                Text(manager.startDate ?? Date(), style: Text.DateStyle.date)
                Text(manager.endDate ?? Date(), style: Text.DateStyle.date)
            }
            Toggle(isOn: $multiRangePicker) {
                Text(multiRangePicker ? "Range Picker" : "Single Picker")
            }
            .toggleStyle(SwitchToggleStyle(tint: .green))
            changeUIDatePicker()
        }
    }
}
#Preview {
    DataPickerView()
}

