//
//  LoginAssembler.swift
//  BudgetApp
//
//  Created by Allan on 28.02.23.
//

import Foundation
import UIKit

final class LoginAssembler{
    private init(){ }
    
    static func makeLoginVC(coordinator: LoginCoordinatorProtocol) -> UIViewController{
        let authService = makeAuthService()
        let vc = LoginVC(viewModel: makeViewModel(authService: authService, coordinator: coordinator))
        return vc
    }
    
    private static func makeViewModel(authService: LoginAuthServiceProtocol, coordinator: LoginCoordinatorProtocol) -> LoginViewModelProtocol{
        return LoginVM(authService: authService, coordinator: coordinator)
    }
    
    private static func makeAuthService() -> LoginAuthServiceProtocol{
        return AuthService()
    }
}
