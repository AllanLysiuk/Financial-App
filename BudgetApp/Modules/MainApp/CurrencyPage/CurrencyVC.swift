//
//  CurrencyVC.swift
//  BudgetApp
//
//  Created by Allan on 2.06.23.
//

import Foundation
import UIKit

final class CurrencyVC: UIViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var tableView: UITableView!
    
    private var viewModel: CurrencyViewModelProtocol
    
    init(viewModel: CurrencyViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        self.tableView.keyboardDismissMode = .onDrag
        titleLabel.font = UIFont(name: "Montserrat-SemiBold", size: 16)
        searchBar.barTintColor = UIColor.white
        searchBar.setBackgroundImage(UIImage.init(), for: UIBarPosition.any, barMetrics: UIBarMetrics.default)
        tableView.tableHeaderView = UIView()
        viewModel.setUpTableView(with: tableView)
        viewModel.loadItems()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if parent == nil {
            viewModel.finish(shouldMoveToParent: false)
        }
    }
}

extension CurrencyVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.seacrhBarTextDidChange(text: searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
