//
//  ReportVM.swift
//  BudgetApp
//
//  Created by Allan on 28.03.23.
//

import Foundation

final class ReportVM: ReportViewModelProtocol {
    
    private weak var coordinator: ReportCoordinatorProtocol?
    
    init(coordinator: ReportCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
}
