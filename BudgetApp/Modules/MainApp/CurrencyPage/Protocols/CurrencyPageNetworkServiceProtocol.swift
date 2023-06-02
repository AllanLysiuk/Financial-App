//
//  CurrencyPageNetworkServiceProtocol.swift
//  BudgetApp
//
//  Created by Allan on 2.06.23.
//

import Foundation

protocol CurrencyPageNetworkServiceProtocol {
    func loadListOfCurrencies(completion: @escaping (([CurrencyElement]) -> Void))
}
