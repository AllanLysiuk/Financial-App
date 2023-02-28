//
//  RegisterVM.swift
//  BudgetApp
//
//  Created by Allan on 28.02.23.
//

import Foundation
final class RegisterVM: RegisterViewModelProtocol{
    
    private var authService: RegisterAuthServiceProtocol
    private var coordinator: RegisterCoordinatorProtocol
    
    init (authService: RegisterAuthServiceProtocol, coordinator: RegisterCoordinatorProtocol){
        self.authService = authService
        self.coordinator = coordinator
    }
    
    func register() {
        authService.register()
        coordinator.finish()
    }
    
    
}
