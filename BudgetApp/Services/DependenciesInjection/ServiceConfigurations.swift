//
//  ServiceConfigurations.swift
//  BudgetApp
//
//  Created by Allan on 6.05.23.
//

import Foundation

final class ServiceConfigurations {
    
    private init() {  }
    
    static func configure(container: Container) {
        container.register({ Self.authService })
        container.register({ Self.networkService })
        container.register({ Self.alertFactory })
    }
    
}

protocol AuthServiceProtocol: AnyObject, LoginAuthServiceProtocol & ForgotPasswordAuthServiceProtocol & RegisterAuthServiceProtocol { }

protocol AlertFactoryProtocol: AnyObject, AlertControllerFactoryProtocol { }

protocol NetworkServiceProtocol: AnyObject { }

private extension ServiceConfigurations {
    
    static var authService: AuthServiceProtocol {
        return AuthService()
    }
    
    static var networkService: NetworkServiceProtocol {
        return NetworkService()
    }
    
    static var alertFactory: AlertFactoryProtocol {
        return AlertControllerFactory()
    }
}
