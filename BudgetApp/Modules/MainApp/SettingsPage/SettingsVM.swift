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
    private var networkService: SettingsNetworkServiceProtocol
    private var adapter: SettingsTableViewAdapterProtocol
    
    private let items: [SettingsTableViewCellModel] = [
    SettingsTableViewCellModel(name: "Begining of month", infoName: "1 may", currencyCode: ""),
    SettingsTableViewCellModel(name: "Currency", infoName: "Belarusian ruble", currencyCode: "Br"),
    SettingsTableViewCellModel(name: "Language", infoName: "", currencyCode: ""),
    SettingsTableViewCellModel(name: "Notifications", infoName: "", currencyCode: "")
    ]
    
    init(coordinator: SettingsCoordinatorProtocol, networkService: SettingsNetworkServiceProtocol, adapter: SettingsTableViewAdapterProtocol) {
        self.coordinator = coordinator
        self.networkService = networkService
        self.adapter = adapter
    }
    
    func setUpTableView(with tableView: UITableView) {
        adapter.setUpTableView(tableView)
    }
    
    func loadData() {
        adapter.setUpItems(items)
    }
    
    
}

extension SettingsVM: SettingsAdapterDelegate {
    
}
