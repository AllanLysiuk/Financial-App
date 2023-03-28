//
//  ReportVC.swift
//  BudgetApp
//
//  Created by Allan on 28.03.23.
//

import Foundation
import UIKit

final class ReportVC: UIViewController {
    private let viewModel: ReportViewModelProtocol
    
    init(viewModel: ReportViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        requiredInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func requiredInit() {
        tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "list.bullet"), tag: 2)
        navigationController?.tabBarItem = tabBarItem
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green
    }
}
