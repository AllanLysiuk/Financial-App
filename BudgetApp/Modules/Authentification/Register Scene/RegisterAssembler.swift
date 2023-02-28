//
//  RegisterAssembler.swift
//  BudgetApp
//
//  Created by Allan on 28.02.23.
//

import Foundation
import UIKit
final class RegisterAssembler{
    private init() { }
    
    static func makeRegisterVC(coordinator: RegisterCoordinatorProtocol) -> UIViewController{
        let authService = makeAuthService()
        let registerVC = RegisterVC(viewModel: makeRegisterViewModel(authService: authService, coordinator: coordinator))
        return registerVC
    }
    
    private static func makeRegisterViewModel(authService: RegisterAuthServiceProtocol, coordinator: RegisterCoordinatorProtocol) -> RegisterViewModelProtocol{
        return RegisterVM(authService: authService, coordinator: coordinator)
    }
    
    private static func makeAuthService() -> RegisterAuthServiceProtocol{
        return AuthService()
    }
}
