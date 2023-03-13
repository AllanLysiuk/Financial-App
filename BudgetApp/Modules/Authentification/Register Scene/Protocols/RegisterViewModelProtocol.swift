//
//  RegisterViewModelProtocol.swift
//  BudgetApp
//
//  Created by Allan on 28.02.23.
//

import Foundation

protocol RegisterViewModelProtocol{
    var email: String? { get }
    
    func finish(shouldMoveToParent: Bool)
    func register(email: String?, password: String?)
}
