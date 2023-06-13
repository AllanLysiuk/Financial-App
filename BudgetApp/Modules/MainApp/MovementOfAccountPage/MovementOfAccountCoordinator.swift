//
//  MovementOfAccountCoordinator.swift
//  BudgetApp
//
//  Created by Allan on 13.06.23.
//

import Foundation
import UIKit

final class MovementOfAccountCoordinator: Coordinator {
    private var parentNavigationController: UINavigationController
    private var rootCoordinator: MovementOfAccountRootCoordinatorProtocol
    var childCoordinators: [Coordinator] = []
    
    init(parentNavigationController: UINavigationController, rootCoordinator: MovementOfAccountRootCoordinatorProtocol) {
        self.rootCoordinator = rootCoordinator
        self.parentNavigationController = parentNavigationController
    }
    
    func start() {
        assert(false, "Should be open with arguments, please use start(accFrom: Account, accTo: Account)")
    }
    
    func start(accFrom: Account, accTo: Account) {
        let vc = MovementOfAccountAssembler.makeMovementVC(coordinator: self, accFrom: accFrom, accTo: accTo)
        parentNavigationController.present(vc, animated: true)
    }
    
    func finish() {
        rootCoordinator.movementFinished(self)
    }
    
}

extension MovementOfAccountCoordinator: MovementOfAccountCoordinatorProtocol {
    func finish(shouldMoveToParent: Bool) {
        if shouldMoveToParent {
            parentNavigationController.dismiss(animated: true)
        }
        finish()
    }
}
