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
        assert(false, "Should be open with delegate, please use start(delegate:)")
    }
    
    func finish() {
        rootCoordinator.addingFinished(self)
    }
    
    func start(delegate: AddNewCategoryViewModelDelegate) {
        let vc = AddNewCategoryAssembler.makeAddNewCategoryVC(coordinator: self, delegate: delegate)
        if let sheet = vc.sheetPresentationController {
            sheet.detents = [.medium()]
        }
        parentNavigationController.present(vc, animated: true)
    }
    
}

extension AddNewCategoryCoordinator: AddNewCategoryCoordinatorProtocol {
    func finish(shouldMoveToParent: Bool) {
        if shouldMoveToParent {
            parentNavigationController.dismiss(animated: true)
        }
        finish()
    }
}
