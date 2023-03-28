//
//  SettingsVCAssembler.swift
//  BudgetApp
//
//  Created by Allan on 28.03.23.
//

import Foundation
import UIKit

final class SettingsVCAssembler {
    
    private init() { }
    
    static func makeSettingsVC(coordinator: SettingsCoordinatorProtocol) -> UIViewController {
        return SettingsVC(viewModel: makeViewModel(coordinator: coordinator))
    }
    
    private static func makeViewModel(coordinator: SettingsCoordinatorProtocol) -> SettingsViewModelProtocol {
        return SettingsVM(coordinator: coordinator)
    }
}
