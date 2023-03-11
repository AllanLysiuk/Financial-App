//
//  LoginViewModelProtocol.swift
//  BudgetApp
//
//  Created by Allan on 28.02.23.
//

import Foundation

protocol LoginViewModelProtocol{
    var delegate: LoginVCDelegate? { get set }
    
    func login()
    func openRegisterScene(with email: String?)
    func openForgotPasswordScene(with email: String?)
}
