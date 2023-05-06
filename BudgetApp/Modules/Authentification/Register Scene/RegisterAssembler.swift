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
    
    static func makeRegisterVC(
        delegate: RegisterViewModelDelegate,
        coordinator: RegisterCoordinatorProtocol,
        email: String?,
        container: Container
    ) -> UIViewController{
        let registerVC = RegisterVC(
            viewModel: makeRegisterViewModel(
                delegate: delegate,
                coordinator: coordinator,
                email: email,
                container: container
            ))
        return registerVC
    }
    
    private static func makeRegisterViewModel(
        delegate: RegisterViewModelDelegate,
        coordinator: RegisterCoordinatorProtocol,
        email: String?,
        container: Container
    ) -> RegisterViewModelProtocol{
        return RegisterVM(
            delegate: delegate,
            authService: makeAuthService(container: container),
            coordinator: coordinator,
            alertFactory: makeAlertFactory(container: container),
            email: email
        )
    }
    
    private static func makeAuthService(container: Container) -> AuthServiceProtocol{
        return container.resolve()
    }
    
    private static func makeAlertFactory(container: Container) -> AlertFactoryProtocol{
        return container.resolve()
    }
}
