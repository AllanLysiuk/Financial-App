//
//  ForgotPasswordViewModelProtocol.swift
//  BudgetApp
//
//  Created by Allan on 3.03.23.
//

import Foundation

protocol ForgotPasswordViewModelProtocol{
    
    var email: String? { get }
    
    func changePassword(email: String?)
    func finish(shouldMoveToParent: Bool)
}
