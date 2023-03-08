//
//  AppCoordinator.swift
//  BudgetApp
//
//  Created by Allan on 28.02.23.
//

import Foundation
import UIKit

final class AppCoordinator: Coordinator{
    private var windowScene: UIWindowScene
    private var window: UIWindow?
    var childCoordinators: [Coordinator] = []
    
    init (windowScene: UIWindowScene){
        self.windowScene = windowScene
    }
    
    func start() {
        openLoginScene()
        window?.makeKeyAndVisible()
    }
    
    func finish() {

    }
    func openLoginScene(){
        let loginWindow = UIWindow(windowScene: windowScene)
        let nc = UINavigationController()
        loginWindow.rootViewController = nc
        
        let loginCoordinator = LoginCoordinator(rootNavigationController: nc, rootCoordinator: self)
        childCoordinators.append(loginCoordinator)
        loginCoordinator.start()
        
        window = loginWindow
    }
    
}


extension AppCoordinator: LoginRootCoordinatorController{
    func finishedLogging(_ coordinator: Coordinator) {
        childCoordinators.removeAll { tmp in
            tmp === coordinator
        }
    }
    
    
}
