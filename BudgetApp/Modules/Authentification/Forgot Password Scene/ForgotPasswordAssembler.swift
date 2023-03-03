//
//  ForgotPasswordAssembler.swift
//  BudgetApp
//
//  Created by Allan on 3.03.23.
//

import Foundation
import UIKit

final class ForgotPasswordAssembler{
    private init(){ }
    
    static func makeForgotPasswordVC(coordinator: ForgotPasswordCoordinatorProtocol) -> UIViewController{
        let authService = makeAuthService()
        let vm = makeViewModel(authService: authService, coordinator: coordinator)
        return ForgotPasswordVC(viewModel: vm)
    }
    
    private static func makeViewModel(authService: ForgotPasswordAuthServiceProtocol, coordinator: ForgotPasswordCoordinatorProtocol) -> ForgotPasswordViewModelProtocol{
        return ForgotPasswordVM(authService: authService, coordinator: coordinator)
    }
    
    private static func makeAuthService() -> ForgotPasswordAuthServiceProtocol{
        return AuthService()
    }
}
