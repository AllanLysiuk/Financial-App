//
//  RegisterVM.swift
//  BudgetApp
//
//  Created by Allan on 28.02.23.
//

import Foundation
final class RegisterVM: RegisterViewModelProtocol{
    
    private var authService: RegisterAuthServiceProtocol
    private weak var coordinator: RegisterCoordinatorProtocol?
    private var alertFactory: AlertControllerFactoryProtocol
    
    init (authService: RegisterAuthServiceProtocol, coordinator: RegisterCoordinatorProtocol, alertFactory: AlertControllerFactoryProtocol){
        self.authService = authService
        self.coordinator = coordinator
        self.alertFactory = alertFactory
    }
    
    func register() {
        authService.register()
        openAlert()
    }
    
    private func openAlert(){
        let alert = alertFactory.makeAlert(title: "Register operation", message: "You've succsesfully signed up", actions: [
            .default("Ok", {
                self.finish(shouldMoveToParent: true)
            })
        ])
        coordinator?.presentAlert(alert)
    }
    
    func finish(shouldMoveToParent: Bool) {
        coordinator?.finish(shouldMoveToParent: shouldMoveToParent)
    }
    
}
