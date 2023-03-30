//
//  HistoryVM.swift
//  BudgetApp
//
//  Created by Allan on 28.03.23.
//

import Foundation

final class HistoryVM: HistoryViewModelProtocol {
    
    private weak var coordinator: HistoryCoordinatorProtocol?
    
    init(coordinator: HistoryCoordinatorProtocol){
        self.coordinator = coordinator
    }
    
}
