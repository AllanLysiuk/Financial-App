//
//  FSCalendarAdapterProtocol.swift
//  BudgetApp
//
//  Created by Allan on 16.06.23.
//

import Foundation
import FSCalendar

protocol FSCalendarAdapterProtocol {
    func setUpCalendarView(_ cakendarView: FSCalendar)
    func selectDate(date: Date)
 //   func setUpDelegate(_ delegate: MovAccAdapterDelegate)
}
