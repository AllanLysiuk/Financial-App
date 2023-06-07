//
//  CurrencyVM.swift
//  BudgetApp
//
//  Created by Allan on 2.06.23.
//

import Foundation
import UIKit

final class CurrencyVM: CurrencyViewModelProtocol {

    private weak var coordinator: CurrencyCoordinatorProtocol?
    private var networkService: CurrencyPageNetworkServiceProtocol
    private var adapter: CurrenciesTableViewAdapterProtocol
    private var repoService: CurrencyPageRepoServiceProtocol
    private var items: [CurrencyElement] = []
    private var filteredItems: [CurrencyElement]!
    
    init(
        coordinator: CurrencyCoordinatorProtocol,
        networkService: CurrencyPageNetworkServiceProtocol,
        adapter: CurrenciesTableViewAdapterProtocol,
        repoService: CurrencyPageRepoServiceProtocol
    ) {
        self.coordinator = coordinator
        self.networkService = networkService
        self.adapter = adapter
        self.repoService = repoService
    }
    
    func finish(shouldMoveToParent: Bool) {
        coordinator?.finish(shouldMoveToParent: shouldMoveToParent)
    }
    
    func setUpTableView(with tableView: UITableView) {
        adapter.setUpTableView(tableView)
        adapter.setUpDelegate(self)
    }
    
    func loadItems() {
        let userShouldntChoose = UserDefaults.standard.bool(forKey: UserDefaultsEnum.userShouldChooseCurrency.rawValue)
        if userShouldntChoose {
            items = repoService.loadCurrenciesFromCoreData()
            adapter.setUpItems(items)
        } else {
            let group = DispatchGroup()
            group.enter()
            networkService.loadListOfCurrencies { arr in
                self.items = arr
                group.leave()
            }
            group.notify(queue: .main) {
                self.adapter.setUpItems(self.items)
                self.repoService.saveCurrenciesToCoreData(items: self.items)
            }
        }
    }
    
    func seacrhBarTextDidChange(text: String) {
        filteredItems = []
        if text.isEmpty {
            filteredItems = items
        } else {
            filteredItems = items.filter { elem in
                if elem.value.uppercased().contains(text.uppercased()) {
                    return true
                }
                return false
            }
        }
        adapter.setUpItems(filteredItems)
    }
        
}

extension CurrencyVM: CurrencyAdapterDelegate {
    func currencyChosen(currency: CurrencyElement) {
        let ud = UserDefaults()
        ud.set("\(currency.value) - \(currency.key)", forKey: UserDefaultsEnum.currentCurrency.rawValue)
        ud.set(true, forKey: UserDefaultsEnum.userShouldChooseCurrency.rawValue)
        NotificationCenter.default.post(name: .currencyChanged, object: nil)
        coordinator?.finish(shouldMoveToParent: true)
    }
}
