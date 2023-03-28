//
//  HistoryVCCoordinator.swift
//  BudgetApp
//
//  Created by Allan on 28.03.23.
//

import UIKit

final class HistoryVCCoordinator: Coordinator {
    private var tabBarController: UITabBarController
    private var rootCoordinator: HistoryRootCoordinatorProtocol
    var childCoordinators: [Coordinator] = []
    
    init(tabBarController: UITabBarController, rootCoordinator: HistoryRootCoordinatorProtocol) {
        self.tabBarController = tabBarController
        self.rootCoordinator = rootCoordinator
    }
    
    func start() {
        let vc = HistoryVCAssembler.makeHistoryVC(coordinator: self)
        tabBarController.addChild(vc)
    }
    
    func finish() {
        tabBarController.removeFromParent()
        rootCoordinator.historyFinished(self)
    }
}

extension HistoryVCCoordinator: HistoryCoordinatorProtocol {
    
}
