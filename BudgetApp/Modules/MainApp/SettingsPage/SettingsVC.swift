//
//  SettingsVC.swift
//  BudgetApp
//
//  Created by Allan on 28.03.23.
//

import Foundation
import UIKit

final class SettingsVC: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var settingsLabel: UILabel!
    
    private var viewModel: SettingsViewModelProtocol
   
    init(viewModel: SettingsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        requiredInit()
    }
    
    private func requiredInit() {
        tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "gearshape"), tag: 3)
        navigationController?.tabBarItem = tabBarItem
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        tableView.layer.cornerRadius = 20
        tableView.tableHeaderView = UIView()
        setUpSettingsLabel()
        viewModel.setUpTableView(with: tableView)
        viewModel.loadData()
    }
    
    private func setUpSettingsLabel() {
        settingsLabel.text = "Settings"
        settingsLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        settingsLabel.font = UIFont(name: "Montserrat-SemiBold", size: 20)
    }
}
