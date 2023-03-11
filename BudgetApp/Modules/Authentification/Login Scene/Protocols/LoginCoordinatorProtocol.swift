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
    func openRegisterScene(delegate: RegisterViewModelDelegate, email: String?)
    func openForgotPasswordScene(delegate: ForgotPasswordViewModelDelegate, email: String?)
    func finish()
    
}
