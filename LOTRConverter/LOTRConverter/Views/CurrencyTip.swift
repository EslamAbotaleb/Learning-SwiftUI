//
//  CurrencyTip.swift
//  LOTRConverter
//
//  Created by Eslam on 28/01/2025.
//

import TipKit

struct CurrencyTip: Tip {
    var title = Text("Change Currency")

    var message: Text? = Text("You can tap the left or right currency to bring up the select currency screen.")

    var image: Image? = Image(systemName: "hand.tap.fill")
}
