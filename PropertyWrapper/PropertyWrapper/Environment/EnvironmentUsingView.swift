//
//  EnvironmentUsingView.swift
//  PropertyWrapper
//
//  Created by Eslam on 01/02/2025.
//

import SwiftUI

struct EnvironmentUsingView: View {
    //MARK: - Shared Data
    @EnvironmentObject var dependency: DataProvider
    var body: some View {
        Text(dependency.currentValue)
    }
}
