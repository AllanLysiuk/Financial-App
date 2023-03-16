//
//  LoginVM.swift
//  BudgetApp
//
//  Created by Allan on 28.02.23.
//

import Foundation

protocol LoginVCDelegate: AnyObject{
    func getEmail(_ email: String)
}

final class LoginVM: LoginViewModelProtocol{    
    
    private var authService: LoginAuthServiceProtocol
    private weak var coordinator: LoginCoordinatorProtocol?
    private var alertFactory: AlertControllerFactoryProtocol
    
    weak var delegate: LoginVCDelegate?
    
    init(authService: LoginAuthServiceProtocol, coordinator: LoginCoordinatorProtocol, alertFactory: AlertControllerFactoryProtocol){
        self.authService = authService
        self.coordinator = coordinator
        self.alertFactory = alertFactory
    }
    
    func login(email: String?, password: String?) {
        guard let email = email, let password = password else {
            return
        }
        if email == "" && password == "" {
            openAlertDefault(title: "Wrong Input", message: "Email or pasword can't be empty", closeScreen: false)
            return
        }
        authService.login(email: email, password: password) { error in
            if error == nil{
                let ud = UserDefaults()
                ud.set(true, forKey: "isRegistered")
                self.openAlertDefault(title: "Login operation", message: "You've succsesfully signed in", closeScreen: true)
            }else{
                self.openAlertDefault(title: "Error", message: error?.localizedDescription, closeScreen: false)
            }
        }
        
    }
    
    private func openAlertDefault(title: String?, message: String?, closeScreen: Bool){
        let alert = alertFactory.makeAlert(title: title, message: message, actions: [
            .default("Ok", {
                if closeScreen{
                    self.coordinator?.finish()
                }
            })
        ])
        coordinator?.presentAlert(alert)
    }
    
    func openRegisterScene(with email: String?) {
        print("Register did tap in LoginVC")
        coordinator?.openRegisterScene(delegate: self, email: email)
    }
    
    func openForgotPasswordScene(with email: String?) {
        print("Forgot password did tap in LoginVC")
        coordinator?.openForgotPasswordScene(delegate: self, email: email)
    }
    
    
}


extension LoginVM: ForgotPasswordViewModelDelegate {
    func changePasswordFinished(with email: String) {
        delegate?.getEmail(email)
    }
}

extension LoginVM: RegisterViewModelDelegate{
    func registerFinished(with email: String) {
        delegate?.getEmail(email)
    }
}
