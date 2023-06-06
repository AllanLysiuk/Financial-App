//
//  CurrencyViewModelProtocol.swift
//  BudgetApp
//
//  Created by Allan on 2.06.23.
//

import Foundation
import UIKit

protocol CurrencyViewModelProtocol {
    func setUpTableView(with tableView: UITableView)
    func finish(shouldMoveToParent: Bool)
    func loadItems()
    func seacrhBarTextDidChange(text: String)
}
