//
//  CalendarVMProtocol.swift
//  BudgetApp
//
//  Created by Allan on 18.06.23.
//

import Foundation
import FSCalendar

protocol CalendarVMProtocol {
    func finish(shouldMoveToParent: Bool)
    func setUpCalendarView(with calendarView: FSCalendar)
}
