//
//  SettingsTableViewAdapter.swift
//  BudgetApp
//
//  Created by Allan on 29.05.23.
//

import Foundation
import UIKit

protocol SettingsAdapterDelegate: AnyObject {
    
}

final class SettingsTableViewAdapter: NSObject {
    private weak var tableView: UITableView?
    private weak var delegate: SettingsAdapterDelegate?
    private var items: [SettingsTableViewCellModel] = []
    
    private func setUpTableView() {
        tableView?.delegate = self
        tableView?.dataSource = self
        registerCells()
    }
    
    private func registerCells() {
        let nib1 = UINib(nibName: "\(SettingsTableViewCell.self)", bundle: nil)
        tableView?.register(nib1, forCellReuseIdentifier: "\(SettingsTableViewCell.self)")
    }

}

//MARK: Adapter Protocol
extension SettingsTableViewAdapter: SettingsTableViewAdapterProtocol {
    func setUpDelegate(_ delegate: SettingsAdapterDelegate) {
        self.delegate = delegate
    }
    
    func setUpTableView(_ tableView: UITableView) {
        self.tableView = tableView
        setUpTableView()
    }

    func setUpItems(_ items: [SettingsTableViewCellModel]) {
        self.items = items
        reloadData()
    }
    
    func reloadData() {
        tableView?.reloadData()
    }
}

//MARK: TableView Delegate
extension SettingsTableViewAdapter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 66
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

//MARK: TableView DataSource
extension SettingsTableViewAdapter: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(SettingsTableViewCell.self)") as? SettingsTableViewCell
        if indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
            cell?.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: tableView.bounds.width)
        }
        cell?.nameLabel.text = items[indexPath.row].name
        cell?.infoLabel.text = items[indexPath.row].infoName
        cell?.currencyCodeLabel.text = items[indexPath.row].currencyCode
        return cell ?? UITableViewCell()
    }
    
}
