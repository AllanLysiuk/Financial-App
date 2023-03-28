//
//  ReportVCAssembler.swift
//  BudgetApp
//
//  Created by Allan on 28.03.23.
//

import Foundation
import UIKit

final class ReportVCAssembler {
    
    private init() { }
    
    static func makeReportVC(coordinator: ReportCoordinatorProtocol) -> UIViewController {
        return ReportVC(viewModel: makeViewModel(coordinator: coordinator))
    }
    
    private static func makeViewModel(coordinator: ReportCoordinatorProtocol) -> ReportViewModelProtocol {
        return ReportVM(coordinator: coordinator)
    }
}
