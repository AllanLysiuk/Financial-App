//
//  CurrenciesTableViewAdapterProtocol.swift
//  BudgetApp
//
//  Created by Allan on 2.06.23.
//

import Foundation
import UIKit

protocol CurrenciesTableViewAdapterProtocol {
    func setUpTableView(_ tableView: UITableView)
    func setUpItems(_ items: [CurrencyElement])
    func setUpDelegate(_ delegate: CurrencyAdapterDelegate)
    func reloadData()
}
