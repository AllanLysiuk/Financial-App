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
    
    private var rootVC: UIViewController?
    init(
        parentNavigationController: UINavigationController,
        rootCoordinator: MovementOfAccountRootCoordinatorProtocol
    ) {
        self.rootCoordinator = rootCoordinator
        self.parentNavigationController = parentNavigationController
    }
    
    func start() {
        assert(false, "Should be open with arguments, please use start(accFrom: Account, accTo: Account)")
    }
    
    func start(accFrom: Account, accTo: Account) {
        let vc = MovementOfAccountAssembler.makeMovementVC(coordinator: self, accFrom: accFrom, accTo: accTo)
        rootVC = vc
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
    
    func openCalendarVC(delegate: MovAccCalendarDelegate) {
        let coordinator = CalendarVCCoordinator(rootVC: rootVC!, rootCoordinator: self)
        childCoordinators.append(coordinator)
        coordinator.start(delegate: delegate)
    }
    
}

extension MovementOfAccountCoordinator: CalendarRootCoordinatorProtocol {
    func dateSelectingFinished(_ coordinator: Coordinator) {
        childCoordinators.removeAll { tmp in
            tmp === coordinator
        }
    }
}
