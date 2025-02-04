//
//  DataPickerView.swift
//  ViewBuilderDynamiForm
//
//  Created by Eslam on 03/02/2025.
//

import SwiftUI

struct DataPickerView: View {
    @State var multiRangePicker: Bool = false

    var body: some View {
        VStack {
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

