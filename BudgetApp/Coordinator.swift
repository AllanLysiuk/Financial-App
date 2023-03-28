//
//  Coordinator.swift
//  BudgetApp
//
//  Created by Allan on 28.02.23.
//

import Foundation

protocol Coordinator: AnyObject {
    
    var childCoordinators: [Coordinator] { get }
    
    func start()
    func finish()
}
