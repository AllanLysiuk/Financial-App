//
//  MovementOfAccountVM.swift
//  BudgetApp
//
//  Created by Allan on 13.06.23.
//

import Foundation
import UIKit

final class MovementOfAccountVM: MovementOfAccountVMProtocol {
    
    private weak var coordinator: MovementOfAccountCoordinatorProtocol?
    private var accFrom: Account
    private var accTo: Account
    
    init(
        coordinator: MovementOfAccountCoordinatorProtocol,
        accFrom: Account,
        accTo: Account
    ){
        self.coordinator = coordinator
        self.accFrom = accFrom
        self.accTo = accTo
    }
    
    func finish(shouldMoveToParent: Bool) {
        coordinator?.finish(shouldMoveToParent: shouldMoveToParent)
    }
    
    func getImageAccFrom() -> UIImage? {
        return UIImage(systemName: accFrom.image ?? "creditcard")
    }
    
    func getImageAccTo() -> UIImage? {
        return UIImage(systemName: accTo.image ?? "creditcard")
    }
}
