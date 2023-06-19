//
//  CalendarPageAdapterProtocol.swift
//  BudgetApp
//
//  Created by Allan on 18.06.23.
//

import Foundation

import FSCalendar

protocol CalendarPageAdapterProtocol {
    func setUpCalendarView(_ cakendarView: FSCalendar)
    func setUpDelegate(_ delegate: CalendarVMAdapterDelegate)
}
