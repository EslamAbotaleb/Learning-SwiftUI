//
//  CountryPickerView.swift
//  OnlineGroceriesSwiftUI
//
//  Created by Eslam on 11/02/2025.
//

import SwiftUI
import CountryPicker

struct CountryPickerView: UIViewControllerRepresentable {
    @Binding var country: Country?

    class Coordinator: NSObject, @preconcurrency CountryPickerDelegate {
        var parent: CountryPickerView
        init(_ parent: CountryPickerView) {
            self.parent = parent
        }
        @MainActor
        func countryPicker(didSelect country: Country) {
            Task {
                parent.country = country
            }
        }
    }
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    func makeUIViewController(context: Context) -> some CountryPickerViewController {
        let countryPicker = CountryPickerViewController()
        countryPicker.selectedCountry = country?.isoCode ?? "EG"
        countryPicker.delegate = context.coordinator
        return countryPicker
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
}


