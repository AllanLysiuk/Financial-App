//
//  EnumSections.swift
//  BudgetApp
//
//  Created by Allan on 1.04.23.
//

import Foundation

enum Sections {
    case income([Account])
    case wallets([Account])
    case costs([Account])
    
    var rowCount: Int {
        switch self {
        case .income(let items):    return items.count
        case .wallets(let items):   return items.count
        case .costs(let items):     return items.count
        }
    }
    
    var getArray: [Account] {
        switch self {
        case .income(let items):    return items
        case .wallets(let items):   return items
        case .costs(let items):     return items
        }
    }
    
    func headerTitles() -> String {
        switch self {
        case .income(_):
            return  "Incomes"
        case .wallets(_):
            return  "Wallets"
        case .costs(_):
            return "Costs"
        }
    }
}
