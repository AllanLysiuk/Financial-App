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
    
    static func makeSettingsVC(coordinator: SettingsCoordinatorProtocol, container: Container) -> UIViewController {
        return SettingsVC(viewModel: makeViewModel(coordinator: coordinator, container: container))
    }
    
    private static func makeViewModel(coordinator: SettingsCoordinatorProtocol, container: Container) -> SettingsViewModelProtocol {
        return SettingsVM(coordinator: coordinator, adapter: makeAdapter(), notificationCenter: makeNotificationCenter() )
    }
    
    private static func makeAdapter() -> SettingsTableViewAdapterProtocol {
        return SettingsTableViewAdapter()
    }
    
    private static func makeNotificationCenter() -> NotificationCenter {
        return NotificationCenter.default
    }
}
