//
//  MainSceneCoordinator.swift
//  BudgetApp
//
//  Created by Allan on 15.03.23.
//

import Foundation
import UIKit

final class HomePageCoordinator: Coordinator{
    private var rootNavigationController: UINavigationController
    private var rootCoordinator: HomePageRootCoordinatorProtocol
    var childCoordinators: [Coordinator] = []
    
    init(rootNavigationController: UINavigationController, rootCoordinator: HomePageRootCoordinatorProtocol){
        self.rootNavigationController = rootNavigationController
        self.rootCoordinator = rootCoordinator
    }
    
    func start() {
        let vc = HomePageAssembler.makeHomePageVC(coordinator: self)
        rootNavigationController.pushViewController(vc, animated: false)
    }
    
    func finish() {
        rootNavigationController.popViewController(animated: false)
        rootCoordinator.finished(self)
    }
    
}

extension HomePageCoordinator: HomePageCoordinatorProtocol{
    
}
