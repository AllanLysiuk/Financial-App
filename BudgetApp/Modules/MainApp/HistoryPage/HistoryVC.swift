//
//  HistoryVC.swift
//  BudgetApp
//
//  Created by Allan on 28.03.23.
//

import Foundation
import UIKit

final class HistoryVC: UIViewController {
    
    private let viewModel: HistoryViewModelProtocol
    
    init(viewModel: HistoryViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        requiredInit()
    }
    
    private func requiredInit() {
        tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "books.vertical"), tag: 1)
        navigationController?.tabBarItem = tabBarItem
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        
    }
}
