//
//  CurrencyVCAssembler.swift
//  BudgetApp
//
//  Created by Allan on 2.06.23.
//

import Foundation
import UIKit
final class CurrencyVCAssembler {
    private init() { }
    
    static func makeCurrencyVC(
        coordinator: CurrencyCoordinatorProtocol,
        container: Container
    ) -> UIViewController {
        let vm = makeVM(coordinator, container)
        return CurrencyVC(viewModel: vm)
    }
    
    private static func makeVM(
        _ coordinator: CurrencyCoordinatorProtocol,
        _ container: Container
    ) -> CurrencyViewModelProtocol {
        return CurrencyVM(coordinator: coordinator, networkService: makeNetworkService(container: container), adapter: makeAdapter())
    }
    
    private static func makeNetworkService(container: Container) -> NetworkServiceProtocol {
        return container.resolve()
    }
    
    private static func makeAdapter() -> CurrenciesTableViewAdapterProtocol {
        return CurrenciesTableViewAdapter()
    }
}
