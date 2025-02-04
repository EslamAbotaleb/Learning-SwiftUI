//
//  FontCalendar.swift
//  ViewBuilderDynamiForm
//
//  Created by Eslam on 04/02/2025.
//

import SwiftUI

class FontCalendar {
    //MARK: - Month
    var monthHeaderFont: Font = .body.bold()
    //MARK: - Week
    var weekDayHeaderFont: Font = .caption
    //MARK: - Today
    var cellTodayFont: Font = .body.bold()
    //MARK: - Disable
    var cellDisabledFont: Font = .body.weight(.light)
    //MARK: - Selected
    var cellSelectedFont: Font = .body.bold()
    //MARK: - UnSelected
    var cellUnSelectedFont: Font = .body
    //MARK: - Date Range
    var cellFromAndToDateFont: Font = .body.bold()
}
