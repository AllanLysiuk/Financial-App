//
//  CalendarVM.swift
//  BudgetApp
//
//  Created by Allan on 18.06.23.
//

import Foundation
import FSCalendar

protocol MovAccCalendarDelegate: AnyObject {
    func dateSelected(date: Date)
}

final class CalendarVM: CalendarVMProtocol {
    private weak var coordinator: CalendarCoordinatorProtocol?
    private var calendarAdapter: CalendarPageAdapterProtocol
    private weak var delegate: MovAccCalendarDelegate?
    
    init(
        coordinator: CalendarCoordinatorProtocol,
        delegate: MovAccCalendarDelegate,
        calendarAdapter: CalendarPageAdapterProtocol
    ) {
        self.coordinator = coordinator
        self.delegate = delegate
        self.calendarAdapter = calendarAdapter
    }
    
    func setUpCalendarView(with calendarView: FSCalendar) {
        calendarAdapter.setUpCalendarView(calendarView)
        calendarAdapter.setUpDelegate(self)
    }
    
    func finish(shouldMoveToParent: Bool) {
        coordinator?.finish(shouldMoveToParent: shouldMoveToParent)
    }
    
}

extension CalendarVM: CalendarVMAdapterDelegate {
    func dateSelected(date: Date) {
        delegate?.dateSelected(date: date)
        finish(shouldMoveToParent: true)
    }
}
