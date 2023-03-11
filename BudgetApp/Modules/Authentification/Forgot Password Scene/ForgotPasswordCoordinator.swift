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
        assert(false, "Should be open with login, please use start(login:)")
    }
    
    func start(delegate: ForgotPasswordViewModelDelegate?, email: String?) {
        let vc = ForgotPasswordAssembler.makeForgotPasswordVC(delegate: delegate, coordinator: self, email: email ?? "")
        parentNavigationController.pushViewController(vc, animated: true)
    }
    
    func finish() {
        parentCoordinator.changePasswordFinished(self)
    }
    
}

extension ForgotPasswordCoordinator: ForgotPasswordCoordinatorProtocol{
    
    func presentAlert(_ alert: UIViewController) {
        parentNavigationController.present(alert, animated: true)
    }
    
    func finish(shouldMoveToParent: Bool) {
        if shouldMoveToParent {
            parentNavigationController.popViewController(animated: true)
        }
        finish()
    }
    
}
