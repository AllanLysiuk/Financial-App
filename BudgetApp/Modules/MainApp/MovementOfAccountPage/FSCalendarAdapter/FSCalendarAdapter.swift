//
//  FSCalendarAdapter.swift
//  BudgetApp
//
//  Created by Allan on 16.06.23.
//

import Foundation
import UIKit
import FSCalendar

final class FSCalendarAdapter: NSObject {
    private weak var calendarView: FSCalendar?
//    private weak var delegate:
    
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

extension FSCalendarAdapter: FSCalendarAdapterProtocol {
    
    func setUpCalendarView(_ calendarView: FSCalendar) {
        self.calendarView = calendarView
        setUPCalendarView()
    }
}

extension FSCalendarAdapter: FSCalendarDataSource {
    func calendar(_ calendar: FSCalendar, subtitleFor date: Date) -> String? {
        return dateToStringFromDate(date: date, format: "E")
    }
}

extension FSCalendarAdapter: FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {

    }
}
