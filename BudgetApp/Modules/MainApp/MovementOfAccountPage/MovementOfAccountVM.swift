//
//  MovementOfAccountVM.swift
//  BudgetApp
//
//  Created by Allan on 13.06.23.
//

import Foundation
import UIKit
import FSCalendar

final class MovementOfAccountVM: MovementOfAccountVMProtocol {
    
    private weak var coordinator: MovementOfAccountCoordinatorProtocol?
    private var calendarAdapter: FSCalendarAdapterProtocol
    private var accFrom: Account
    private var accTo: Account
    
    init(
        coordinator: MovementOfAccountCoordinatorProtocol,
        accFrom: Account,
        accTo: Account,
        calendarAdapter: FSCalendarAdapterProtocol
    ){
        self.coordinator = coordinator
        self.accFrom = accFrom
        self.accTo = accTo
        self.calendarAdapter = calendarAdapter
    }
    
    func setUpCalendarView(with calendarView: FSCalendar) {
        calendarAdapter.setUpCalendarView(calendarView)
    }
    
//    func setUpDelegate() {
//        
//    }
    
    func finish(shouldMoveToParent: Bool) {
        coordinator?.finish(shouldMoveToParent: shouldMoveToParent)
    }
    
    #warning("Я всегда уверен что здесь будет значение могу ли я использовать форсанврап")
    func getInfoAccFrom() -> (type: String, sum: Double, name: String, image: UIImage?) {
        return (accFrom.type ?? "", accFrom.sum, accFrom.name ?? "", UIImage(systemName: accFrom.image ?? "creditcard"))
    }
    
    func getInfoAccTo() -> (type: String, name: String, image: UIImage?) {
        return (accTo.type ?? "", accTo.name ?? "", UIImage(systemName: accTo.image ?? "creditcard"))
    }
}
