//
//  ColorSettings.swift
//  ViewBuilderDynamiForm
//
//  Created by Eslam on 04/02/2025.
//

import SwiftUI

class ColorDateRangePicker {
    //MARK: - Disable Colors
    var disabledColor = Color.gray
    var disabledBackColor = Color.clear
    //MARK: - Month Colors
    var monthHeaderColor = Color.primary
    var monthHeaderBackColor = Color.clear
    var monthBackColor = Color.clear
    //MARK: - Week Colors
    var weekDayHeaderColor = Color.secondary
    var weekDayHeaderBackColor = Color.clear
    //MARK: - Today Colors
    var todayBackColor = Color.gray
    var todayColor = Color.green
    //MARK: - Date Range Colors
    var betweenStartAndEndDateBackColor = Color.init(.systemGray3)
    var betweenStartAndEndDateColor = Color.gray.opacity(0.4)
    //MARK: - Selection
    var selectedBackColor = Color.blue
    var selectedColor = Color.white
    /// Common
    var textColor = Color.primary
    var textBackColor = Color.clear
    var calendarBackColor = Color.init(.systemGray6)
}
