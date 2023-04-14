//
//  AddNewCategoryAssembler.swift
//  BudgetApp
//
//  Created by Allan on 13.04.23.
//

import Foundation
import UIKit

final class AddNewCategoryAssembler {
    private init() { }
    
    static func makeAddNewCategoryVC(coordinator: AddNewCategoryCoordinatorProtocol, delegate: AddNewCategoryViewModelDelegate) -> UIViewController {
        let vm = makeVM(coordinator, delegate)
        return AddNewCategoryVC(viewModel: vm)
    }
    
    private static func makeVM(_ coordinator: AddNewCategoryCoordinatorProtocol, _ delegate: AddNewCategoryViewModelDelegate) -> AddNewCategoryVMProtocol {
        return AddNewCategoryVM(coordinator: coordinator, delegate: delegate)
    }
}
