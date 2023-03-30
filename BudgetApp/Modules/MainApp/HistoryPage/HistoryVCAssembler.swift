//
//  HistoryVCAssembler.swift
//  BudgetApp
//
//  Created by Allan on 28.03.23.
//

import UIKit

final class HistoryVCAssembler {
    
    private init() { }
    
    static func makeHistoryVC(coordinator: HistoryCoordinatorProtocol)-> UIViewController {
        let vc = HistoryVC(viewModel: makeViewModel(coordinator: coordinator))
        return vc
    }
    
    private static func makeViewModel( coordinator: HistoryCoordinatorProtocol) -> HistoryViewModelProtocol{
        return HistoryVM(coordinator: coordinator)
    }
}
