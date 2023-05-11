//
//  MainScreenViewModelProtocol.swift
//  BudgetApp
//
//  Created by Allan on 15.03.23.
//

import Foundation
import UIKit

protocol HomePageViewModelProtocol {
    func setUpTableView(with tableView: UITableView)
    func loadData(dataNeedsToBeLoaded: Bool)
}
