//
//  LoginCoordinatorProtocol.swift
//  BudgetApp
//
//  Created by Allan on 28.02.23.
//

import Foundation
import UIKit
protocol LoginCoordinatorProtocol: AnyObject{
    func presentAlert(_ alert: UIViewController)
    func openRegisterScene()
    func openForgotPasswordScene()
    func finish()
    
}
