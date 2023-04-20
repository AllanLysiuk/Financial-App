//
//  CurrencyElement.swift
//  BudgetApp
//
//  Created by Allan on 18.04.23.
//

import Foundation

struct CurrencyElement: Codable {
    let success: Bool
    let symbols: [Symbols]
}

struct Symbols: Codable {
    let key: String
    let value: String
}

