//
//  CollectionViewAdapterProtocol.swift
//  BudgetApp
//
//  Created by Allan on 1.04.23.
//

import Foundation
import UIKit

protocol TableViewAdapterProtocol {
    func setUpTableView(_ tableView: UITableView)
    func setUpItems(_ items: [Sections])
    func setUpCollectionViewDelegate(_ delegate: HomePageCollectionAdapterDelegate)
    func reloadData()
}
