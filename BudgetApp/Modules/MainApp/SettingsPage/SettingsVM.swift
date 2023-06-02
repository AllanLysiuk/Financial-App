//
//  SettingsVM.swift
//  BudgetApp
//
//  Created by Allan on 28.03.23.
//

import Foundation
import UIKit

final class SettingsVM: SettingsViewModelProtocol {

    private weak var coordinator: SettingsCoordinatorProtocol?
    private var adapter: SettingsTableViewAdapterProtocol
    
    private let items: [SettingsTableViewCellModel] = [
    SettingsTableViewCellModel(name: "Begining of month", infoName: "1 may", currencyCode: nil),
    SettingsTableViewCellModel(name: "Currency", infoName: "Belarusian ruble", currencyCode: "Br"),
    SettingsTableViewCellModel(name: "Language", infoName: nil, currencyCode: nil),
    SettingsTableViewCellModel(name: "Notifications", infoName: nil, currencyCode: nil)
    ]
    
    init(coordinator: SettingsCoordinatorProtocol, adapter: SettingsTableViewAdapterProtocol) {
        self.coordinator = coordinator
        self.adapter = adapter
    }
    
    func setUpTableView(with tableView: UITableView) {
        adapter.setUpTableView(tableView)
    }
    
    func loadData() {
        adapter.setUpDelegate(self)
        adapter.setUpItems(items)
    }
    
    
}

extension SettingsVM: SettingsAdapterDelegate {
    func openCurrencyScreen() {
        coordinator?.openCurrencyScreen()
    }
}
