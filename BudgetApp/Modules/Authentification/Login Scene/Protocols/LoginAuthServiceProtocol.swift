//
//  LoginAuthServiceProtocol.swift
//  BudgetApp
//
//  Created by Allan on 28.02.23.
//

import Foundation
protocol LoginAuthServiceProtocol{
    func login(email: String, password: String, completion: @escaping (_ error: Error?) -> Void)
}
