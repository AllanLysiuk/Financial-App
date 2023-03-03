//
//  LoginCoordinator.swift
//  BudgetApp
//
//  Created by Allan on 28.02.23.
//

import Foundation
import UIKit

final class LoginCoordinator: Coordinator{
    private var rootNavigationController: UINavigationController
    private var rootCoordinator: LoginRootCoordinatorController
    var childCoordinators: [Coordinator] = []
    
    init(rootNavigationController: UINavigationController, rootCoordinator: LoginRootCoordinatorController){
        self.rootNavigationController = rootNavigationController
        self.rootCoordinator = rootCoordinator
    }
    
    func start() {
        let vc = LoginAssembler.makeLoginVC(coordinator: self)
        rootNavigationController.pushViewController(vc, animated: false)
    }
    
    func finish() {
        rootNavigationController.popViewController(animated: false)
        rootCoordinator.finishedLogging(self)
    }
    
}

extension LoginCoordinator: LoginCoordinatorProtocol{
    func openRegisterScene() {
        let registerCoordinator = RegisterCoordinator(rootCoordinator: self, parentNavigationController: rootNavigationController)
        childCoordinators.append(registerCoordinator)
        registerCoordinator.start()
    }
    
    func openForgotPasswordScene() {
        let coordinator = ForgotPasswordCoordinator(parentNavigationController: rootNavigationController, parentCoordinator: self)
        childCoordinators.append(coordinator)
        coordinator.start()
    }
    
    
}

extension LoginCoordinator: RegisterRootCoordinatorProtocol{
    func registerFinished(_ coordinator: Coordinator) {
        childCoordinators.removeAll { tmp in
            tmp === coordinator
        }
    }
}
extension LoginCoordinator: ForgotPasswordRootCoordinatorProtocol{
    func changePasswordFinished(_ coordinator: Coordinator) {
        childCoordinators.removeAll { tmp in
            tmp === coordinator
        }
    }
}
