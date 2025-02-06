//
//  FreestandingMacro.swift
//  MacroTutoiral
//
//  Created by Eslam on 06/02/2025.
//

import Foundation
//MARK: - consider as exists independency & this mean define this macro as global not inside class || struct || function
// Defining a macro in Swift


func myFunction() {
    print("Currently running \(#function)")
#warning("Something's wrong")
}

//let expressionMacroUrl = #URL("")
//let blogURL = URL(string: "")!

