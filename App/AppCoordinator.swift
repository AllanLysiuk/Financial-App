//
//  AppCoordinator.swift
//  BudgetApp
//
//  Created by Allan on 28.02.23.
//

import Foundation
import UIKit

final class AppCoordinator: Coordinator{
    private var window: UIWindow
    var childCoordinators: [Coordinator] = []
    
    private lazy var rootNavigationController: UINavigationController = {
        let nc = UINavigationController()
        window.rootViewController = nc
        return nc
    }()
    
    init (window: UIWindow){
        self.window = window
    }
    
    func start() {
        window.makeKeyAndVisible()
    }
    
    func finish() {

    }
    
    
}
