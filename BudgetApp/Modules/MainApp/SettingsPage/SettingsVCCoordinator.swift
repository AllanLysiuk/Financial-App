//
//  SettingsVCCoordinator.swift
//  BudgetApp
//
//  Created by Allan on 28.03.23.
//

import UIKit

final class SettingsVCCoordinator: Coordinator {
    private var tabBarController: UITabBarController
    private var rootCoordinator: SettingsRootCoordinatorProtocol
    private var container: Container
    private var navigationController = UINavigationController()
    var childCoordinators: [Coordinator] = []
    
    init(tabBarController: UITabBarController, rootCoordinator: SettingsRootCoordinatorProtocol, container: Container) {
        self.tabBarController = tabBarController
        self.rootCoordinator = rootCoordinator
        self.container = container
    }
    
    func start() {
        let vc = SettingsVCAssembler.makeSettingsVC(coordinator: self, container: container)
        navigationController.addChild(vc)
        tabBarController.addChild(navigationController)
    }
    
    func finish() {
        tabBarController.removeFromParent()
        rootCoordinator.settingsFinished(self)
    }
}

extension SettingsVCCoordinator: SettingsCoordinatorProtocol {
    func openCurrencyScreen() {
        let currencyCoordinator = CurrencyVCCoordinator(parentNavigationController: navigationController, rootCoordinator: self, container: container)
        childCoordinators.append(currencyCoordinator)
        currencyCoordinator.start(animated: true)
    }
}

extension SettingsVCCoordinator: CurrencyRootCoordinatorProtocol {
    func finish(_ coordinator: Coordinator) {
        childCoordinators.removeAll { tmp in
            tmp === coordinator
        }
    }
}
