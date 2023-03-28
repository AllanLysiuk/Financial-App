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
    var childCoordinators: [Coordinator] = []
    
    init(tabBarController: UITabBarController, rootCoordinator: SettingsRootCoordinatorProtocol) {
        self.tabBarController = tabBarController
        self.rootCoordinator = rootCoordinator
    }
    
    func start() {
        let vc = SettingsVCAssembler.makeSettingsVC(coordinator: self)
        tabBarController.addChild(vc)
    }
    
    func finish() {
        tabBarController.removeFromParent()
        rootCoordinator.settingsFinished(self)
    }
}

extension SettingsVCCoordinator: SettingsCoordinatorProtocol {
    
}
