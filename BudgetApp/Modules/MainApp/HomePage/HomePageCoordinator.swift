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
    private var container: Container
    private var navigationController = UINavigationController()
    
    var childCoordinators: [Coordinator] = []
    
    init(
        tabBarController: UITabBarController,
        rootCoordinator: HomePageRootCoordinatorProtocol,
        container: Container
    ) {
        self.tabBarController = tabBarController
        self.rootCoordinator = rootCoordinator
        self.container = container
    }
    
    func start() {
        let vc = HomePageAssembler.makeHomePageVC(coordinator: self, container: container)
        navigationController.addChild(vc)
        tabBarController.addChild(navigationController)
    }
    
    func finish() {
        tabBarController.removeFromParent()
        rootCoordinator.homePageFinished(self)
    }
    
}

extension HomePageCoordinator: HomePageCoordinatorProtocol {
    func openAddNewCategoryScene(_ delegate: AddNewCategoryViewModelDelegate, isWalletAdding: Bool) {
        let coordinator = AddNewCategoryCoordinator(parentNavigationController: navigationController, rootCoordinator: self)
        childCoordinators.append(coordinator)
        coordinator.start(delegate: delegate, isWalletAdding: isWalletAdding)
    }
}


extension HomePageCoordinator: AddNewCategoryRootCoordinatorProtocol {
    func addingFinished(_ coordinator: Coordinator) {
        childCoordinators.removeAll { tmp in
            tmp === coordinator
        }
    }
}
