//
//  StringExtension.swift
//  BudgetApp
//
//  Created by Allan on 7.06.23.
//

import Foundation

extension String {
    func parseCurrencyFromUD() -> [String] {
        let delimetr = " - "
        var tokens: [String] = []
        tokens = self.components(separatedBy: delimetr)
        return tokens
    }
}
