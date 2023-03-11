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


final class RegisterVM: RegisterViewModelProtocol{    
    
    private var authService: RegisterAuthServiceProtocol
    private weak var coordinator: RegisterCoordinatorProtocol?
    private var alertFactory: AlertControllerFactoryProtocol
    
    private weak var delegate: RegisterViewModelDelegate?
    
    init (delegate: RegisterViewModelDelegate, authService: RegisterAuthServiceProtocol, coordinator: RegisterCoordinatorProtocol, alertFactory: AlertControllerFactoryProtocol){
        self.authService = authService
        self.coordinator = coordinator
        self.alertFactory = alertFactory
        self.delegate = delegate
    }
    
    func register(email: String?) {
        authService.register()
        delegate?.registerFinished(with: email ?? "")
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
