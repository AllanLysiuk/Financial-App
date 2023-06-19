//
//  MovementOfAccountVMProtocol.swift
//  BudgetApp
//
//  Created by Allan on 13.06.23.
//

import Foundation
import UIKit
import FSCalendar

protocol MovementOfAccountVMProtocol {
    func finish(shouldMoveToParent: Bool)
    func getInfoAccFrom() -> (type: String, sum: Double, name: String, image: UIImage?)
    func getInfoAccTo() -> (type: String, name: String, image: UIImage?)
    func setUpCalendarView(with calendarView: FSCalendar)
    func saveButtonDidTap(date: Date)
    func buttonCalendarDidTap()
}
