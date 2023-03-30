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
        let vc = LoginVC(viewModel: makeViewModel(coordinator: coordinator))
        return vc
    }
    
    private static func makeViewModel(coordinator: LoginCoordinatorProtocol) -> LoginViewModelProtocol{
        return LoginVM(authService: makeAuthService(), coordinator: coordinator, alertFactory: makeAlertFactory())
    }
    
    private static func makeAuthService() -> LoginAuthServiceProtocol{
        return AuthService()
    }
    
    private static func makeAlertFactory() -> AlertControllerFactoryProtocol {
        return AlertControllerFactory()
    }
}
