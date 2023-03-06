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

    init (authService: ForgotPasswordAuthServiceProtocol, coordinator: ForgotPasswordCoordinatorProtocol){
        self.authService = authService
        self.coordinator = coordinator
    }
    
    func changePassword() {
        authService.forgotPassword()
        coordinator?.finish(shouldMoveToParent: true)
    }
    
    func finish(shouldMoveToParent: Bool){
        coordinator?.finish(shouldMoveToParent: shouldMoveToParent)
    }
    
}
