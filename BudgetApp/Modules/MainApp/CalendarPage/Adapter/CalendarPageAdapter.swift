//
//  CalendarPageAdapter.swift
//  BudgetApp
//
//  Created by Allan on 18.06.23.
//

import Foundation
import FSCalendar

protocol CalendarVMAdapterDelegate: AnyObject {
    func dateSelected(date: Date)
}

final class CalendarPageAdapter: NSObject {
    private weak var calendarView: FSCalendar?
    private weak var delegate: CalendarVMAdapterDelegate?
    
    private func setUPCalendarView() {
        calendarView?.delegate = self
        calendarView?.dataSource = self
    }
    
    private func dateToStringFromDate(date: Date, format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let stringDate = dateFormatter.string(from: date)
        return stringDate
    }
}

extension CalendarPageAdapter: CalendarPageAdapterProtocol {
    
    func setUpCalendarView(_ calendarView: FSCalendar) {
        self.calendarView = calendarView
        setUPCalendarView()
    }
    
    func setUpDelegate(_ delegate: CalendarVMAdapterDelegate) {
        self.delegate = delegate
    }
    
}

extension CalendarPageAdapter: FSCalendarDataSource {
    func calendar(_ calendar: FSCalendar, subtitleFor date: Date) -> String? {
        return dateToStringFromDate(date: date, format: "E")
    }
}

extension CalendarPageAdapter: FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        delegate?.dateSelected(date: date)
    }
}
