//
//  ForgotPasswordAuthServiceProtocol.swift
//  BudgetApp
//
//  Created by Allan on 3.03.23.
//

import Foundation
protocol ForgotPasswordAuthServiceProtocol{
    func forgotPassword(email: String, completion: @escaping (_ error: Error?) -> Void)
}
