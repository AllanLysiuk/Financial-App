//
//  HomePageRepoServiceProtocol.swift
//  BudgetApp
//
//  Created by Allan on 10.05.23.
//

import Foundation

protocol HomePageRepoServiceProtocol {
    func loadInfo() -> [AccountType.RawValue : [Account]]
    func addNewAccount(name: String, type: String, imageName: String, sum: Double, considerInBalanceFlag: Bool) //-> Account
    func loadInfoByType(type: AccountType) -> [Account]
}
