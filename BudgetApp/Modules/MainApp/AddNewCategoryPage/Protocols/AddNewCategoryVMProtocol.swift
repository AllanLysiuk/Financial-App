//
//  AddNewCategoryVMProtocol.swift
//  BudgetApp
//
//  Created by Allan on 13.04.23.
//

import Foundation
import UIKit

protocol AddNewCategoryVMProtocol {
    func finish(shouldMoveToParent: Bool)
    
    func buttonSaveDidTap(name: String, image: UIImage, sum: Double, considerInBalanceFlag: Bool)
    func buttonCloseDidTap()
}
