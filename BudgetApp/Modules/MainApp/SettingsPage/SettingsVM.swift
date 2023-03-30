//
//  SettingsVM.swift
//  BudgetApp
//
//  Created by Allan on 28.03.23.
//

import Foundation

final class SettingsVM: SettingsViewModelProtocol {
    
    private weak var coordinator: SettingsCoordinatorProtocol?
    
    init(coordinator: SettingsCoordinatorProtocol) {
        self.coordinator = coordinator
    }
}
