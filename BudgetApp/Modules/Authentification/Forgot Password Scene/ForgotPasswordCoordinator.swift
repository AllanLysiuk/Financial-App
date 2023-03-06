//
//  ForgotPasswordCoordinator.swift
//  BudgetApp
//
//  Created by Allan on 3.03.23.
//

import Foundation
import UIKit

final class ForgotPasswordCoordinator: Coordinator{
    
    private var parentNavigationController: UINavigationController
    private var parentCoordinator: ForgotPasswordRootCoordinatorProtocol
    var childCoordinators: [Coordinator] = []
    
    init(parentNavigationController: UINavigationController, parentCoordinator: ForgotPasswordRootCoordinatorProtocol){
        self.parentCoordinator = parentCoordinator
        self.parentNavigationController = parentNavigationController
    }
    
    func start() {
        let vc = ForgotPasswordAssembler.makeForgotPasswordVC(coordinator: self)
        parentNavigationController.pushViewController(vc, animated: true)
    }
    
    func finish() {
        parentCoordinator.changePasswordFinished(self)
    }
    
}

extension ForgotPasswordCoordinator: ForgotPasswordCoordinatorProtocol{
    
    func finish(shouldMoveToParent: Bool) {
        if shouldMoveToParent {
            parentNavigationController.popViewController(animated: true)
        }
        finish()
    }
    
}
