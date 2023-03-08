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
        let registerVC = RegisterVC(viewModel: makeRegisterViewModel(coordinator: coordinator))
        return registerVC
    }
    
    private static func makeRegisterViewModel(coordinator: RegisterCoordinatorProtocol) -> RegisterViewModelProtocol{
        return RegisterVM(authService: makeAuthService(), coordinator: coordinator, alertFactory: makeAlertFactory())
    }
    
    private static func makeAuthService() -> RegisterAuthServiceProtocol{
        return AuthService()
    }
    
    private static func makeAlertFactory() -> AlertControllerFactoryProtocol{
        return AlertControllerFactory()
    }
}
