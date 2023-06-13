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

final class LoginVM: LoginViewModelProtocol {
    
    private var authService: LoginAuthServiceProtocol
    private weak var coordinator: LoginCoordinatorProtocol?
    private var alertFactory: AlertControllerFactoryProtocol
    
    private weak var delegate: LoginVCDelegate?
    
    init(authService: LoginAuthServiceProtocol, coordinator: LoginCoordinatorProtocol, alertFactory: AlertControllerFactoryProtocol) {
        self.authService = authService
        self.coordinator = coordinator
        self.alertFactory = alertFactory
    }
    
    func login(email: String?, password: String?) {
        if let email = email, let password = password, (email != "" && password != "") {
            authService.login(email: email, password: password) { error in
                if let error = error {
                    self.openAlertDefault(title: "Error", message: error.localizedDescription, shouldCloseScreen: false)
                } else {
                    let ud = UserDefaults()
                    ud.set(true, forKey: UserDefaultsEnum.isRegistered.rawValue)
                    self.openAlertDefault(title: "Login operation", message: "You've succsesfully signed in", shouldCloseScreen: true)
                }
            }
        } else {
            openAlertDefault(title: "Wrong Input", message: "Email or pasword can't be empty", shouldCloseScreen: false)
            return
        }
    }

    private func openAlertDefault(title: String?, message: String?, shouldCloseScreen: Bool) {
        let alert = alertFactory.makeAlert(title: title, message: message, actions: [
            .default("Ok", {
                if shouldCloseScreen {
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
    
    func setupViewDelegate(_ delegate: LoginVCDelegate) {
        self.delegate = delegate
    }
    
}


extension LoginVM: ForgotPasswordViewModelDelegate {
    func changePasswordFinished(with email: String) {
        #warning("not get, name needs to be changed")
        delegate?.getEmail(email)
    }
}

extension LoginVM: RegisterViewModelDelegate {
    func registerFinished(with email: String) {
        delegate?.getEmail(email)
    }
}
