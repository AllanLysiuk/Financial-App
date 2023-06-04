//
//  CurrenciesTableViewAdapter.swift
//  BudgetApp
//
//  Created by Allan on 2.06.23.
//

import Foundation
import UIKit

protocol CurrencyAdapterDelegate: AnyObject {
    func currencyChosen(currency: CurrencyElement)
}

final class CurrenciesTableViewAdapter: NSObject {
    private weak var tableView: UITableView?
    private weak var delegate: CurrencyAdapterDelegate?
    private var items: [CurrencyElement] = []
    
    private func setUpTableView() {
        tableView?.delegate = self
        tableView?.dataSource = self
        registerCells()
    }
    
    private func registerCells() {
        let nib1 = UINib(nibName: "\(CurrencyTableViewCell.self)", bundle: nil)
        tableView?.register(nib1, forCellReuseIdentifier: "\(CurrencyTableViewCell.self)")
    }

}

//MARK: Adapter Protocol
extension CurrenciesTableViewAdapter: CurrenciesTableViewAdapterProtocol {
    func setUpDelegate(_ delegate: CurrencyAdapterDelegate) {
        self.delegate = delegate
    }
    
    func setUpTableView(_ tableView: UITableView) {
        self.tableView = tableView
        setUpTableView()
    }

    func setUpItems(_ items: [CurrencyElement]) {
        self.items = items
        reloadData()
    }
    
    func reloadData() {
        tableView?.reloadData()
    }
}

//MARK: TableView Delegate
extension CurrenciesTableViewAdapter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 62
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.currencyChosen(currency: items[indexPath.row])
    }
    
}

//MARK: TableView DataSource
extension CurrenciesTableViewAdapter: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = (tableView.dequeueReusableCell(withIdentifier: "\(CurrencyTableViewCell.self)") as? CurrencyTableViewCell)
            if indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
                cell?.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: tableView.bounds.width)
            }
            cell?.currencyNameLabel.text = items[indexPath.row].value
            cell?.currencyCodeLabel.text = items[indexPath.row].key
            return cell ?? UITableViewCell()
    }
    
}
