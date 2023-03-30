//
//  ForgotPasswordCoordinatorProtocol.swift
//  BudgetApp
//
//  Created by Allan on 3.03.23.
//

import Foundation
import UIKit

protocol ForgotPasswordCoordinatorProtocol: AnyObject{
    func presentAlert(_ alert: UIViewController)
    func finish(shouldMoveToParent: Bool)
}
