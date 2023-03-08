//
//  ForgotPasswordVM.swift
//  BudgetApp
//
//  Created by Allan on 3.03.23.
//

import Foundation
final class ForgotPasswordVM: ForgotPasswordViewModelProtocol{
    
    private let authService: ForgotPasswordAuthServiceProtocol
    private weak var coordinator: ForgotPasswordCoordinatorProtocol?
    private let alertFactory: AlertControllerFactoryProtocol

    init (authService: ForgotPasswordAuthServiceProtocol, coordinator: ForgotPasswordCoordinatorProtocol, alertFactory: AlertControllerFactoryProtocol){
        self.authService = authService
        self.coordinator = coordinator
        self.alertFactory = alertFactory
    }
    
    func changePassword() {
        authService.forgotPassword()
        openAlert()
    }
    
    private func openAlert(){
        let alert = alertFactory.makeActionSheet(title: "Success", message: "You've changed password", actions: [.default("Ok", {
            self.finish(shouldMoveToParent: true)
        })])
        coordinator?.presentAlert(alert)
    }
    
    func finish(shouldMoveToParent: Bool){
        coordinator?.finish(shouldMoveToParent: shouldMoveToParent)
    }
    
}
