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
        let vm = makeViewModel(coordinator: coordinator)
        return ForgotPasswordVC(viewModel: vm)
    }
    
    private static func makeViewModel(coordinator: ForgotPasswordCoordinatorProtocol) -> ForgotPasswordViewModelProtocol{
        return ForgotPasswordVM(authService: makeAuthService(), coordinator: coordinator, alertFactory: makeAlertFactory())
    }
    
    private static func makeAuthService() -> ForgotPasswordAuthServiceProtocol{
        return AuthService()
    }
    private static func makeAlertFactory() -> AlertControllerFactoryProtocol{
        return AlertControllerFactory()
    }
}
