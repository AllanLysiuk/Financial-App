//
//  SettingsVC.swift
//  BudgetApp
//
//  Created by Allan on 28.03.23.
//

import Foundation
import UIKit

final class SettingsVC: UIViewController {
    
    private var viewModel: SettingsViewModelProtocol
    
    init(viewModel: SettingsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        requiredInit()
    }
    
    private func requiredInit(){
        tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "gearshape"), tag: 3)
        navigationController?.tabBarItem = tabBarItem
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .cyan
    }
}
