//
//  CalendarVCAssembler.swift
//  BudgetApp
//
//  Created by Allan on 18.06.23.
//

import Foundation
import UIKit

final class CalendarVCAssembler {
    private init() { }
    
    static func makeCalendarVC(coordinator: CalendarCoordinatorProtocol, delegate: MovAccCalendarDelegate) -> UIViewController {
        let vm = makeVM(coordinator: coordinator, delegate: delegate)
        return CalendarVC(viewModel: vm)
    }
    
    private static func makeVM(coordinator: CalendarCoordinatorProtocol, delegate: MovAccCalendarDelegate) -> CalendarVMProtocol {
        return CalendarVM(coordinator: coordinator, delegate: delegate, calendarAdapter: makeCalendarAdapter())
    }
    
    private static func makeCalendarAdapter() -> CalendarPageAdapterProtocol {
        return CalendarPageAdapter()
    }
}
