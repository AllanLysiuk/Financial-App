//
//  MovementOfAccountVMProtocol.swift
//  BudgetApp
//
//  Created by Allan on 13.06.23.
//

import Foundation
import UIKit

protocol MovementOfAccountVMProtocol {
    func finish(shouldMoveToParent: Bool)
    func getImageAccFrom() -> UIImage?
    func getImageAccTo() -> UIImage?
}
