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
    var childCoordinators: [Coordinator] = []
    
    init(tabBarController: UITabBarController, rootCoordinator: SettingsRootCoordinatorProtocol, container: Container) {
        self.tabBarController = tabBarController
        self.rootCoordinator = rootCoordinator
        self.container = container
    }
    
    func start() {
        let vc = SettingsVCAssembler.makeSettingsVC(coordinator: self, container: container)
        tabBarController.addChild(vc)
    }
    
    func finish() {
        tabBarController.removeFromParent()
        rootCoordinator.settingsFinished(self)
    }
}

extension SettingsVCCoordinator: SettingsCoordinatorProtocol {
    
}
