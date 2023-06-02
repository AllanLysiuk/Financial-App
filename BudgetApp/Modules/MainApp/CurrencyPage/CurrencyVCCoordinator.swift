//
//  CurrencyVCCoordinator.swift
//  BudgetApp
//
//  Created by Allan on 2.06.23.
//

import Foundation
import UIKit

final class CurrencyVCCoordinator: Coordinator {
    private var parentNavigationController: UINavigationController
    private var rootCoordinator: CurrencyRootCoordinatorProtocol
    private var container: Container
    
    var childCoordinators: [Coordinator] = []
    
    init(parentNavigationController: UINavigationController, rootCoordinator: CurrencyRootCoordinatorProtocol, container: Container) {
        self.rootCoordinator = rootCoordinator
        self.parentNavigationController = parentNavigationController
        self.container = container
    }
    
    func start() {
        let vc = CurrencyVCAssembler.makeCurrencyVC(coordinator: self, container: container)
        parentNavigationController.present(vc, animated: false)
    }
    
    func finish() {
        rootCoordinator.finish(self)
    }
    
}

extension CurrencyVCCoordinator: CurrencyCoordinatorProtocol {
    func finish(shouldMoveToParent: Bool) {
        if shouldMoveToParent {
            parentNavigationController.dismiss(animated: true)
        }
        finish()
    }
}
