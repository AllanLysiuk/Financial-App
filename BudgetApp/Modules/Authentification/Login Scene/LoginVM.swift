//
//  LoginVM.swift
//  BudgetApp
//
//  Created by Allan on 28.02.23.
//

import Foundation

final class LoginVM: LoginViewModelProtocol{
    
    private var authService: LoginAuthServiceProtocol
    private weak var coordinator: LoginCoordinatorProtocol?
    
    init(authService: LoginAuthServiceProtocol, coordinator: LoginCoordinatorProtocol){
        self.authService = authService
        self.coordinator = coordinator
    }
    
    func login() {
        print("Login did tap in LoginVM")
        authService.login()
        coordinator?.finish()
    }
    
    func openRegisterScene() {
        print("Register did tap in LoginVC")
        coordinator?.openRegisterScene()
    }
    
    func openForgotPasswordScene() {
        print("Forgot password did tap in LoginVC")
        coordinator?.openForgotPasswordScene()
    }
    
    
    
}
