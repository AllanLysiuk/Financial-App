//
//  ReportVCCoordinator.swift
//  BudgetApp
//
//  Created by Allan on 28.03.23.
//

import UIKit

final class ReportVCCoordinator: Coordinator {
    private var tabBarController: UITabBarController
    private var rootCoordinator: ReportRootCoordinatorProtocol
    var childCoordinators: [Coordinator] = []
    
    init(tabBarController: UITabBarController, rootCoordinator: ReportRootCoordinatorProtocol) {
        self.tabBarController = tabBarController
        self.rootCoordinator = rootCoordinator
    }
    
    func start() {
        let vc = ReportVCAssembler.makeReportVC(coordinator: self)
        tabBarController.addChild(vc)
    }
    
    func finish() {
        tabBarController.removeFromParent()
        rootCoordinator.reportFinished(self)
    }
}

extension ReportVCCoordinator: ReportCoordinatorProtocol {
    
}
