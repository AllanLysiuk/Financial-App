//
//  TabBarAssembler.swift
//  BudgetApp
//
//  Created by Allan on 24.03.23.
//

import Foundation
import UIKit

final class TabBarAssembler {
    
    private init() { }
    
    static func makeTabBarController(coordinator: TabBarCoordinatorProtocol) -> UITabBarController{
        return TabBarController()
    }
    
}
