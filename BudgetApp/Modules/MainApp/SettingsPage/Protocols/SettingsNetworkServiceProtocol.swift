//
//  SettingsNetworkServiceProtocol.swift
//  BudgetApp
//
//  Created by Allan on 29.05.23.
//

import Foundation

protocol SettingsNetworkServiceProtocol {
    func loadListOfCurrencies(completion: @escaping (([CurrencyElement]) -> Void))
}
