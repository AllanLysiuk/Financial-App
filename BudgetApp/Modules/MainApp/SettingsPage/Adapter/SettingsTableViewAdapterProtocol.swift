//
//  SettingsTableViewAdapterProtocol.swift
//  BudgetApp
//
//  Created by Allan on 29.05.23.
//

import Foundation
import UIKit

protocol SettingsTableViewAdapterProtocol {
    func setUpTableView(_ tableView: UITableView)
    func setUpItems(_ items: [SettingsTableViewCellModel])
    func setUpDelegate(_ delegate: SettingsAdapterDelegate)
    func reloadData()
}
