//
//  AddNewCategoryVM.swift
//  BudgetApp
//
//  Created by Allan on 13.04.23.
//

import Foundation
import UIKit

protocol AddNewCategoryViewModelDelegate: AnyObject {
    func newCategoryCreated(name: String, image: UIImage)
}

final class AddNewCategoryVM: AddNewCategoryVMProtocol {

    private weak var coordinator: AddNewCategoryCoordinatorProtocol?
    private weak var delegate: AddNewCategoryViewModelDelegate?
    
    init (coordinator: AddNewCategoryCoordinatorProtocol, delegate: AddNewCategoryViewModelDelegate) {
        self.coordinator = coordinator
        self.delegate = delegate
    }
    
    func finish(shouldMoveToParent: Bool) {
        coordinator?.finish(shouldMoveToParent: shouldMoveToParent)
    }
    
    func buttonSaveDidTap(name: String, image: UIImage) {
        delegate?.newCategoryCreated(name: name, image: image)
        finish(shouldMoveToParent: true)
    }
    
    func buttonCloseDidTap() {
        finish(shouldMoveToParent: true)
    }
}
