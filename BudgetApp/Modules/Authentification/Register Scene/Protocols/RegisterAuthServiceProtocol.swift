//
//  RegisterAuthServiceProtocol.swift
//  BudgetApp
//
//  Created by Allan on 28.02.23.
//

import Foundation
protocol RegisterAuthServiceProtocol {
    func register(email: String, password: String, completion: @escaping (_ error: Error?) -> Void)
}
