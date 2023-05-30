//
//  TabBarCoordinator.swift
//  BudgetApp
//
//  Created by Allan on 24.03.23.
//

import Foundation
import UIKit

final class TabBarCoordinator: Coordinator{
    private var rootNavigationController: UINavigationController
    private var rootCoordinator: TabBarRootCoordinatorProtocol
    private var container: Container
    var childCoordinators: [Coordinator] = []
    
    init(
        rootNavigationController: UINavigationController,
        rootCoordinator: TabBarRootCoordinatorProtocol,
        container: Container
    ) {
        self.rootNavigationController = rootNavigationController
        self.rootCoordinator = rootCoordinator
        self.container = container
    }
    
    func start() {
        let vc = TabBarAssembler.makeTabBarController(coordinator: self)
        
        generateHomeItem(tabBar: vc)
        generateHistoryItem(tabBar: vc)
        generateReportItem(tabBar: vc)
        generateSettingsItem(tabBar: vc)
        rootNavigationController.navigationBar.isHidden = true
        rootNavigationController.pushViewController(vc, animated: false)
    }
    
    func finish() {
        rootNavigationController.popViewController(animated: false)
        rootCoordinator.finished(self)
    }
    
    private func generateHomeItem(tabBar: UITabBarController) {
        let coordinator = HomePageCoordinator(tabBarController: tabBar, rootCoordinator: self, container: container)
        childCoordinators.append(coordinator)
        coordinator.start()
    }
    
    private func generateHistoryItem(tabBar: UITabBarController) {
        let coordinator = HistoryVCCoordinator(tabBarController: tabBar, rootCoordinator: self)
        coordinator.start()
    }
    
    private func generateReportItem(tabBar: UITabBarController) {
        let coordinator = ReportVCCoordinator(tabBarController: tabBar, rootCoordinator: self)
        coordinator.start()
    }

    private func generateSettingsItem(tabBar: UITabBarController) {
        let coordinator = SettingsVCCoordinator(tabBarController: tabBar, rootCoordinator: self, container: container)
        coordinator.start()
    }
    
}

extension TabBarCoordinator: TabBarCoordinatorProtocol { }

extension TabBarCoordinator: HomePageRootCoordinatorProtocol {
    func homePageFinished(_ coordinator: Coordinator) {
        
    }
}

extension TabBarCoordinator: HistoryRootCoordinatorProtocol {
    func historyFinished(_ coordinator: Coordinator) {
        
    }
}

extension TabBarCoordinator: ReportRootCoordinatorProtocol {
    func reportFinished(_ coordinator: Coordinator) {
        
    }
}

extension TabBarCoordinator: SettingsRootCoordinatorProtocol {
    func settingsFinished(_ coordinator: Coordinator) {
        
    }    
}
