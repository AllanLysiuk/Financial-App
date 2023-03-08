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
    private var alertFactory: AlertControllerFactoryProtocol
    
    init(authService: LoginAuthServiceProtocol, coordinator: LoginCoordinatorProtocol, alertFactory: AlertControllerFactoryProtocol){
        self.authService = authService
        self.coordinator = coordinator
        self.alertFactory = alertFactory
    }
    
    func login() {
        print("Login did tap in LoginVM")
        authService.login()
        openAlert()
    }
    
    private func openAlert(){
        let alert = alertFactory.makeAlert(title: "Login operation", message: "You've succsesfully signed in", actions: [
            .default("Ok", {
               // self.coordinator?.finish()
            })
        ])
        coordinator?.presentAlert(alert)
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
