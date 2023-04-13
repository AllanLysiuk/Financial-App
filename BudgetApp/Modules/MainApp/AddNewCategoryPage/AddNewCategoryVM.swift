//
//  AddNewCategoryVM.swift
//  BudgetApp
//
//  Created by Allan on 13.04.23.
//

import Foundation

final class AddNewCategoryVM: AddNewCategoryVMProtocol {

    private weak var coordinator: AddNewCategoryCoordinatorProtocol?
   
    init (coordinator: AddNewCategoryCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func finish() {
        coordinator?.finish(shouldMoveToParent: true)
    }
}
