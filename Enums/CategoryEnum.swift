//
//  CategoryEnum.swift
//  BudgetApp
//
//  Created by Allan on 6.05.23.
//

import Foundation

enum CategoryEnum {
    case income(String)
    case wallet(String)
    case cost(String)
    
    func getName() -> String {
        switch self {
        case .income(let string):
            return string
        case .wallet(let string):
            return string
        case .cost(let string):
            return string
        }
    }
    
    func getType() -> String {
        switch self {
        case .income(let string):
            return "Income"
        case .wallet(let string):
            return "Wallet"
        case .cost(let string):
            return "Cost"
        }
    }
}
