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
        
    }
    
    func openForgotPasswordScene() {
        
    }
    
    
}
