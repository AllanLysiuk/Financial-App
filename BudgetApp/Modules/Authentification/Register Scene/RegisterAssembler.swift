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
    
    static func makeRegisterVC(delegate: RegisterViewModelDelegate, coordinator: RegisterCoordinatorProtocol, email: String?) -> UIViewController{
        let registerVC = RegisterVC(viewModel: makeRegisterViewModel(delegate: delegate, coordinator: coordinator), email: email ?? "")
        return registerVC
    }
    
    private static func makeRegisterViewModel(delegate: RegisterViewModelDelegate,coordinator: RegisterCoordinatorProtocol) -> RegisterViewModelProtocol{
        return RegisterVM(delegate: delegate, authService: makeAuthService(), coordinator: coordinator, alertFactory: makeAlertFactory())
    }
    
    private static func makeAuthService() -> RegisterAuthServiceProtocol{
        return AuthService()
    }
    
    private static func makeAlertFactory() -> AlertControllerFactoryProtocol{
        return AlertControllerFactory()
    }
}
