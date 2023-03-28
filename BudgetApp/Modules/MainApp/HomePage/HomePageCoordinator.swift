//
//  MainSceneCoordinator.swift
//  BudgetApp
//
//  Created by Allan on 15.03.23.
//

import Foundation
import UIKit

final class HomePageCoordinator: Coordinator {
    private var tabBarController: UITabBarController
    private var rootCoordinator: HomePageRootCoordinatorProtocol
    var childCoordinators: [Coordinator] = []
    
    init(tabBarController: UITabBarController, rootCoordinator: HomePageRootCoordinatorProtocol) {
        self.tabBarController = tabBarController
        self.rootCoordinator = rootCoordinator
    }
    
    func start() {
        let vc = HomePageAssembler.makeHomePageVC(coordinator: self)
        tabBarController.addChild(vc)
    }
    
    func finish() {
        tabBarController.removeFromParent()
        rootCoordinator.homePageFinished(self)
    }
    
}

extension HomePageCoordinator: HomePageCoordinatorProtocol {
    
}
