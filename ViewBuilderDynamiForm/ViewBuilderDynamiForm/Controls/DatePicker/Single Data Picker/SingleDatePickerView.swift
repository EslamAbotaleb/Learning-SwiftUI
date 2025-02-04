//
//  SingleDatePickerView.swift
//  ViewBuilderDynamiForm
//
//  Created by Eslam on 03/02/2025.
//

import SwiftUI

struct SingleDatePickerView: View {
    @State private var date = Date()
    var body: some View {
        VStack(alignment: .leading) {
            DatePicker(
                "Start Date",
                selection: $date,
                displayedComponents: [.date]
            )
            .datePickerStyle(.graphical)
            Text(date.formatted())
                .padding(.horizontal, 0)
                .fontWeight(.heavy)
                .frame(maxWidth: .infinity, alignment: .center)
        }
    }
}


#Preview {
    SingleDatePickerView()
}
