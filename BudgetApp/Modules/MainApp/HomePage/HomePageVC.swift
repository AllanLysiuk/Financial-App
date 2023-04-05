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
        self.viewModel.setUpDelegate(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        viewModel.setUpCollectionView(with: tableView)
        viewModel.loadData()
    }
    
}

extension HomePageVC: HomePageDelegate {
    func getViewHeight() -> Double {
        return self.view.frame.height
    }
}
