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
    private var notificationCenter: NotificationCenter
    
    private var items: [SettingsTableViewCellModel] = [
    SettingsTableViewCellModel(name: "Begining of month", infoName: "1 may", currencyCode: nil),
    SettingsTableViewCellModel(name: "Currency", infoName: "", currencyCode: ""),
    SettingsTableViewCellModel(name: "Language", infoName: nil, currencyCode: nil),
    SettingsTableViewCellModel(name: "Notifications", infoName: nil, currencyCode: nil)
    ]
    
    init(coordinator: SettingsCoordinatorProtocol, adapter: SettingsTableViewAdapterProtocol, notificationCenter: NotificationCenter) {
        self.coordinator = coordinator
        self.adapter = adapter
        self.notificationCenter = notificationCenter
        requiredInit()
    }
    #warning("так задавать дефолтное значение норм?")
    private func requiredInit() {
       replaceCurrencyInArr()
    }
    
    private func replaceCurrencyInArr() {
        let currentCurrency = UserDefaults.standard.string(forKey: UserDefaultsEnum.currentCurrency.rawValue)
        let tokens = currentCurrency?.parseCurrencyFromUD()
        items[1].infoName = tokens?[0]
        items[1].currencyCode = tokens?[1]
    }
    
    func setUpTableView(with tableView: UITableView) {
        adapter.setUpTableView(tableView)
    }
    
    func setUpDelegate() {
        adapter.setUpDelegate(self)
    }
    
    func loadData() {
        adapter.setUpItems(items)
    }
    
    
    func initNotificationCenter() {
        notificationCenter.addObserver(self, selector: #selector(currencyChanged(_:)), name: .currencyChanged, object: nil)
    }
    
    func deinitNotificationCenter() {
        notificationCenter.removeObserver(self, name: .currencyChanged, object: nil)
    }
    
    @objc private func currencyChanged(_ notification: Notification) {
        replaceCurrencyInArr()
        loadData()
    }
}

extension SettingsVM: SettingsAdapterDelegate {
    func openCurrencyScreen() {
        coordinator?.openCurrencyScreen()
    }
}
