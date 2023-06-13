//
//  MovementOfAccountAssembler.swift
//  BudgetApp
//
//  Created by Allan on 13.06.23.
//

import Foundation
import UIKit

final class MovementOfAccountAssembler {
    private init() { }
    
    static func makeMovementVC(coordinator: MovementOfAccountCoordinatorProtocol, accFrom: Account, accTo: Account) -> UIViewController {
        let vm = makeVM(coordinator: coordinator, accFrom: accFrom, accTo: accTo)
        return MovementOfAccountVC(viewModel: vm)
    }
    
    private static func makeVM(coordinator: MovementOfAccountCoordinatorProtocol, accFrom: Account, accTo: Account) -> MovementOfAccountVMProtocol {
        return MovementOfAccountVM(coordinator: coordinator, accFrom: accFrom, accTo: accTo)
    }
    
}
