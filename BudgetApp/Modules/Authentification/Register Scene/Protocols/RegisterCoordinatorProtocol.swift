//
//  RegisterCoordinatorProtocol.swift
//  BudgetApp
//
//  Created by Allan on 28.02.23.
//

import Foundation
import UIKit

protocol RegisterCoordinatorProtocol: AnyObject {
    func presentAlert(_ alert: UIViewController)
    func finish(shouldMoveToParent: Bool)
}
