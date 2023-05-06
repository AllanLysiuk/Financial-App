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
    
    static func makeLoginVC(container: Container, coordinator: LoginCoordinatorProtocol) -> UIViewController{
        let vc = LoginVC(viewModel: makeViewModel(container: container, coordinator: coordinator))
        return vc
    }
    
    private static func makeViewModel(container: Container, coordinator: LoginCoordinatorProtocol) -> LoginViewModelProtocol{
        return LoginVM(authService: makeAuthService(container: container), coordinator: coordinator, alertFactory: makeAlertFactory(container: container))
    }
    
    private static func makeAuthService(container: Container) ->AuthServiceProtocol{
        return container.resolve()
    }
    
    private static func makeAlertFactory(container: Container) -> AlertFactoryProtocol {
        return container.resolve()
    }
}
