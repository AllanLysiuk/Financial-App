//
//  CurrencyPageRepoServiceProtocol.swift
//  BudgetApp
//
//  Created by Allan on 4.06.23.
//

import Foundation

protocol CurrencyPageRepoServiceProtocol {
    func saveCurrenciesToCoreData(items: [CurrencyElement])
    func loadCurrenciesFromCoreData() -> [CurrencyElement]
}
