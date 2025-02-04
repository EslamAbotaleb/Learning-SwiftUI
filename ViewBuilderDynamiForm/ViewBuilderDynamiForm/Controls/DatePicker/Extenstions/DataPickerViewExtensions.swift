//
//  DataPickerViewExtensions.swift
//  ViewBuilderDynamiForm
//
//  Created by Eslam on 03/02/2025.
//

import SwiftUI

extension DataPickerView {
    @ViewBuilder
    func changeUIDatePicker() -> some View {
        if multiRangePicker {
//            DateRangePickerView()
            VStack {
                CustomizeUIDateRange(manager: manager)
            }
            .padding()
        } else {
            SingleDatePickerView()
        }
    }
}
