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
    
    static func makeForgotPasswordVC(delegate: ForgotPasswordViewModelDelegate?, coordinator: ForgotPasswordCoordinatorProtocol, email: String) -> UIViewController{
        let vm = makeViewModel(delegate: delegate, coordinator: coordinator)
        return ForgotPasswordVC(viewModel: vm, email: email)
    }
    
    private static func makeViewModel(delegate: ForgotPasswordViewModelDelegate?, coordinator: ForgotPasswordCoordinatorProtocol) -> ForgotPasswordViewModelProtocol{
        return ForgotPasswordVM(delegate: delegate, authService: makeAuthService(), coordinator: coordinator, alertFactory: makeAlertFactory())
    }
    
    private static func makeAuthService() -> ForgotPasswordAuthServiceProtocol{
        return AuthService()
    }
    private static func makeAlertFactory() -> AlertControllerFactoryProtocol{
        return AlertControllerFactory()
    }
}
