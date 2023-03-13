//
//  ForgotPasswordVM.swift
//  BudgetApp
//
//  Created by Allan on 3.03.23.
//

import Foundation

protocol ForgotPasswordViewModelDelegate: AnyObject {
    func changePasswordFinished(with email: String)
}

final class ForgotPasswordVM: ForgotPasswordViewModelProtocol{
    
    private let authService: ForgotPasswordAuthServiceProtocol
    private weak var coordinator: ForgotPasswordCoordinatorProtocol?
    private let alertFactory: AlertControllerFactoryProtocol

    private weak var delegate: ForgotPasswordViewModelDelegate?
    var email: String?
    
    init (delegate: ForgotPasswordViewModelDelegate?,authService: ForgotPasswordAuthServiceProtocol, coordinator: ForgotPasswordCoordinatorProtocol, alertFactory: AlertControllerFactoryProtocol, email: String){
        self.authService = authService
        self.coordinator = coordinator
        self.alertFactory = alertFactory
        self.delegate = delegate
        self.email = email
    }
    
    func changePassword(email: String?) {
        guard let email = email else { return }
        
        if email == "" {
            openAlert(title: "Wrong Input", message: "Email can't be empty", closeScreen: false)
            return
        } else {
            authService.forgotPassword(email: email){ error in
                if error == nil{
                    self.delegate?.changePasswordFinished(with: email)
                    self.openAlert(title: "Change password operation", message: "You've succsesfully changed password", closeScreen: true)
                }else{
                    self.openAlert(title: "Error", message: error?.localizedDescription, closeScreen: false)
                }
            }
        }
    }
    
    private func openAlert(title: String?, message: String?, closeScreen: Bool){
        let alert = alertFactory.makeActionSheet(title: title, message: message, actions: [.default("Ok", {
            if closeScreen{
                self.finish(shouldMoveToParent: true)
            }
        })])
        coordinator?.presentAlert(alert)
    }
    
    func finish(shouldMoveToParent: Bool){
        coordinator?.finish(shouldMoveToParent: shouldMoveToParent)
    }
    
}
