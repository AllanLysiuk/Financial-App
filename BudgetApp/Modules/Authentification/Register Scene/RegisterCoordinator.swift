//
//  RegisterCoordinator.swift
//  BudgetApp
//
//  Created by Allan on 28.02.23.
//

import Foundation
import UIKit

final class RegisterCoordinator: Coordinator{
    var childCoordinators: [Coordinator] = []
    
    private var rootCoordinator: RegisterRootCoordinatorProtocol
    private var parentNavigationController: UINavigationController
    private var container: Container
    
    init(
        rootCoordinator: RegisterRootCoordinatorProtocol,
        parentNavigationController: UINavigationController,
        container: Container
    ){
        self.rootCoordinator = rootCoordinator
        self.parentNavigationController = parentNavigationController
        self.container = container
    }
    
    func start() {
        assert(false, "Should be open with login, please use start(login:)")
    }
    
    func start(delegate: RegisterViewModelDelegate, email: String?) {
        let registerVC = RegisterAssembler.makeRegisterVC(delegate: delegate, coordinator: self, email: email, container: container)
        parentNavigationController.pushViewController(registerVC, animated: true)
    }
    
    func finish() {
        rootCoordinator.registerFinished(self)
    }
    
    
}

extension RegisterCoordinator: RegisterCoordinatorProtocol{
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
