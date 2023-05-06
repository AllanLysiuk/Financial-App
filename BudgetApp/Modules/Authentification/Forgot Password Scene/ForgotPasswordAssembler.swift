//
//  ForgotPasswordAssembler.swift
//  BudgetApp
//
//  Created by Allan on 3.03.23.
//

import Foundation
import UIKit

final class ForgotPasswordAssembler {
    private init() { }
    
    static func makeForgotPasswordVC(
        delegate: ForgotPasswordViewModelDelegate?,
        coordinator: ForgotPasswordCoordinatorProtocol,
        email: String,
        container: Container
    ) -> UIViewController {
        let vm = makeViewModel(delegate: delegate, coordinator: coordinator, email: email, container: container)
        return ForgotPasswordVC(viewModel: vm)
    }
    
    private static func makeViewModel(
        delegate: ForgotPasswordViewModelDelegate?,
        coordinator: ForgotPasswordCoordinatorProtocol,
        email: String,
        container: Container
    ) -> ForgotPasswordViewModelProtocol {
        return ForgotPasswordVM(delegate: delegate, authService: makeAuthService(container: container), coordinator: coordinator, alertFactory: makeAlertFactory(container: container), email: email)
    }
    
    private static func makeAuthService(container: Container) -> AuthServiceProtocol{
        return container.resolve()
    }
    private static func makeAlertFactory(container: Container) -> AlertFactoryProtocol{
        return container.resolve()
    }
}
