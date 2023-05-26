//
//  MainScreen.swift
//  BudgetApp
//
//  Created by Allan on 15.03.23.
//

import Foundation
import UIKit


final class HomePageVC: UIViewController{
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var viewModel: HomePageViewModelProtocol
    
    init(viewModel: HomePageViewModelProtocol){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        requiredInit()
    }
    
    private func requiredInit() {
        tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "circle.grid.3x3"), tag: 0)
        navigationController?.tabBarItem = tabBarItem
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        tableView.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        tableView.separatorColor = UIColor.clear
        viewModel.setUpTableView(with: tableView)
        viewModel.loadData(dataNeedsToBeLoaded: true)
    }
    
}
