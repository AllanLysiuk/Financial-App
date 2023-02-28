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
    
    init(rootCoordinator: RegisterRootCoordinatorProtocol, parentNavigationController: UINavigationController){
        self.rootCoordinator = rootCoordinator
        self.parentNavigationController = parentNavigationController
    }
    
    func start() {
        let registerVC = RegisterAssembler.makeRegisterVC(coordinator: self)
        parentNavigationController.pushViewController(registerVC, animated: true)
    }
    
    func finish() {
        parentNavigationController.popViewController(animated: true)
        rootCoordinator.registerFinished(self)
    }
    
    
}

extension RegisterCoordinator: RegisterCoordinatorProtocol{}
