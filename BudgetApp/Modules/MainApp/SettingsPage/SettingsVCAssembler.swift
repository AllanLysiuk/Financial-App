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
        return SettingsVM(coordinator: coordinator, networkService: makeNetworkService(container: container), adapter: makeAdapter() )
    }
    
    private static func makeAdapter() -> SettingsTableViewAdapterProtocol {
        return SettingsTableViewAdapter()
    }
    
    private static func makeNetworkService(container: Container) -> NetworkServiceProtocol {
        return container.resolve()
    }
}
