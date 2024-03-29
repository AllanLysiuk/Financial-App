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
    private var container: Container
    var childCoordinators: [Coordinator] = []
    
    
    init(
        rootNavigationController: UINavigationController,
         rootCoordinator: LoginRootCoordinatorController,
        container: Container
    ){
        self.rootNavigationController = rootNavigationController
        self.rootCoordinator = rootCoordinator
        self.container = container
    }
    
    func start() {
        let vc = LoginAssembler.makeLoginVC(container: container, coordinator: self)
        rootNavigationController.pushViewController(vc, animated: false)
    }
    
    func finish() {
        rootNavigationController.popViewController(animated: false)
        rootCoordinator.finishedLogging(self)
    }
    
}

extension LoginCoordinator: LoginCoordinatorProtocol{
    func presentAlert(_ alert: UIViewController) {
        rootNavigationController.present(alert, animated: true)
    }
    
    func openRegisterScene(delegate: RegisterViewModelDelegate, email: String?) {
        let registerCoordinator = RegisterCoordinator(
            rootCoordinator: self,
            parentNavigationController: rootNavigationController,
            container: container
        )
        childCoordinators.append(registerCoordinator)
        registerCoordinator.start(delegate: delegate, email: email)
    }
    
    func openForgotPasswordScene(delegate: ForgotPasswordViewModelDelegate, email: String?) {
        let coordinator = ForgotPasswordCoordinator(
            parentNavigationController: rootNavigationController,
            parentCoordinator: self,
            container: container
        )
        childCoordinators.append(coordinator)
        coordinator.start(delegate: delegate, email: email)
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
