//
//  AddNewCategoryCoordinator.swift
//  BudgetApp
//
//  Created by Allan on 13.04.23.
//

import Foundation
import UIKit

final class AddNewCategoryCoordinator: Coordinator {
    private var parentNavigationController: UINavigationController
    private var rootCoordinator: AddNewCategoryRootCoordinatorProtocol
    
    var childCoordinators: [Coordinator] = []
    
    init(parentNavigationController: UINavigationController, rootCoordinator: AddNewCategoryRootCoordinatorProtocol) {
        self.rootCoordinator = rootCoordinator
        self.parentNavigationController = parentNavigationController
    }
    
    
    func start() {
        let vc = AddNewCategoryAssembler.makeAddNewCategoryVC(coordinator: self)
        parentNavigationController.present(vc, animated: true)
    }
    
    func finish() {
        rootCoordinator.addingFinished(self)
    }
    
    
}
#warning("Если я презенчу экран нужна ли мне функция шуд мув ту пэрент")
extension AddNewCategoryCoordinator: AddNewCategoryCoordinatorProtocol {
    func finish(shouldMoveToParent: Bool) {
        if shouldMoveToParent {
            parentNavigationController.dismiss(animated: true)
              }
        finish()
    }
}
