//
//  RegisterVM.swift
//  BudgetApp
//
//  Created by Allan on 28.02.23.
//

import Foundation

protocol RegisterViewModelDelegate: AnyObject {
    func registerFinished(with email: String)
}


final class RegisterVM: RegisterViewModelProtocol {
  
    private var authService: RegisterAuthServiceProtocol
    private weak var coordinator: RegisterCoordinatorProtocol?
    private var alertFactory: AlertControllerFactoryProtocol
    
    private weak var delegate: RegisterViewModelDelegate?
    var email: String?
    
    init (delegate: RegisterViewModelDelegate,
          authService: RegisterAuthServiceProtocol,
          coordinator: RegisterCoordinatorProtocol,
          alertFactory: AlertControllerFactoryProtocol,
          email: String?) {
        self.authService = authService
        self.coordinator = coordinator
        self.alertFactory = alertFactory
        self.delegate = delegate
        self.email = email
    }
    
    func register(email: String?, password: String?, checkPassword: String?) {
        if password != checkPassword {
            openAlert(title: "Incorrect Input", message: "Passwords are different, try one more time", shouldCloseScreen: false)
            return
        }
        
        if let email = email, let password = password, let checkPassword = checkPassword, (email != "" && password != "" && checkPassword != "") {
            authService.register(email: email, password: password) {error in
                if error == nil {
                    self.delegate?.registerFinished(with: email)
                    self.openAlert(title: "Register operation", message: "You've succsesfully signed up", shouldCloseScreen: true)
                } else {
                    self.openAlert(title: "Error", message: error?.localizedDescription, shouldCloseScreen: false)
                }
            }
        } else {
            openAlert(title: "Wrong Input", message: "Email or password can't be empty", shouldCloseScreen: false)
            return
        }
    }

    private func openAlert(title: String?, message: String?, shouldCloseScreen: Bool) {
        let alert = alertFactory.makeAlert(title: title, message: message, actions: [
            .default("Ok", {
                if shouldCloseScreen {
                    self.finish(shouldMoveToParent: true)
                }
            })
        ])
        coordinator?.presentAlert(alert)
    }
    
    func finish(shouldMoveToParent: Bool) {
        coordinator?.finish(shouldMoveToParent: shouldMoveToParent)
    }
}
