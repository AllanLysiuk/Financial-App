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
    private var items: [CurrencyElement] = []
    
    init(coordinator: CurrencyCoordinatorProtocol, networkService: CurrencyPageNetworkServiceProtocol, adapter: CurrenciesTableViewAdapterProtocol) {
        self.coordinator = coordinator
        self.networkService = networkService
        self.adapter = adapter
    }
    
    func finish(shouldMoveToParent: Bool) {
        coordinator?.finish(shouldMoveToParent: shouldMoveToParent)
    }
    
    func setUpTableView(with tableView: UITableView) {
        adapter.setUpTableView(tableView)
    }
    
    func loadItems() {
        networkService.loadListOfCurrencies { arr in
            self.items = arr
        }
        adapter.setUpItems(items)
        
    }
        
}
