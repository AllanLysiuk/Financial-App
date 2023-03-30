//
//  LoginViewModelProtocol.swift
//  BudgetApp
//
//  Created by Allan on 28.02.23.
//

import Foundation

protocol LoginViewModelProtocol{
    
    func setupViewDelegate(_ delegate: LoginVCDelegate)
    
    func login(email: String?, password: String?)
    func openRegisterScene(with email: String?)
    func openForgotPasswordScene(with email: String?)
}
