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
        openLoginScene()
        window.makeKeyAndVisible()
    }
    
    func finish() {

    }
    func openLoginScene(){
        let loginCoordinator = LoginCoordinator(rootNavigationController: rootNavigationController, rootCoordinator: self)
        childCoordinators.append(loginCoordinator)
        loginCoordinator.start()
    }
    
}


extension AppCoordinator: LoginRootCoordinatorController{
    func finishedLogging(_ coordinator: Coordinator) {
        childCoordinators.removeAll { tmp in
            tmp === coordinator
        }
    }
    
    
}
