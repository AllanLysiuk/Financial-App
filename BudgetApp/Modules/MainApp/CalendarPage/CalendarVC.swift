//
//  CalendarVC.swift
//  BudgetApp
//
//  Created by Allan on 18.06.23.
//

import Foundation
import UIKit
import FSCalendar

final class CalendarVC: UIViewController {
    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var buttonClose: UIButton!
    @IBOutlet private weak var calendarView: FSCalendar!
    
    private var viewModel: CalendarVMProtocol
    
    init(viewModel: CalendarVMProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.setUpCalendarView(with: calendarView)
        setUpUI()
    }
    
    private func setUpUI() {
        self.view.backgroundColor = UIColor(red: 0.938, green: 0.938, blue: 0.938, alpha: 1)
        
        label.text = "Choose date"
        label.textColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont(name: "Montserrat-SemiBold", size: 16)
        
        buttonClose.tintColor = UIColor(red: 0.498, green: 0.498, blue: 0.498, alpha: 1)
        
        setUpCalendarView()
    }
    
    private func setUpCalendarView() {

        calendarView.layer.cornerRadius = 40
        
        calendarView?.select(Date())
        calendarView?.scrollDirection = .horizontal
        calendarView?.scope = .month
        calendarView?.firstWeekday = 2

        calendarView?.appearance.headerTitleFont = UIFont(name: "Montserrat-SemiBold", size: 19.5)
        calendarView?.appearance.headerTitleColor = UIColor(red: 0.157, green: 0.157, blue: 0.161, alpha: 1)
        calendarView?.appearance.headerMinimumDissolvedAlpha = 0
        
        calendarView?.appearance.titleFont = UIFont(name: "Montserrat-Regular", size: 16)
        calendarView?.appearance.titleDefaultColor =  UIColor(red: 0.157, green: 0.157, blue: 0.161, alpha: 1)
        calendarView?.appearance.titleSelectionColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)


        calendarView.weekdayHeight = 20.0
        calendarView.appearance.weekdayFont = UIFont(name: "Montserrat-SemiBold", size: 16)
        calendarView.appearance.weekdayTextColor = UIColor(red: 0.157, green: 0.157, blue: 0.161, alpha: 1)
        
        calendarView?.appearance.selectionColor = UIColor(red: 0.204, green: 0.412, blue: 0.945, alpha: 1)
        
        calendarView.appearance.subtitleFont = UIFont(name: "Montserrat-SemiBold", size: 0)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if parent == nil {
            viewModel.finish(shouldMoveToParent: false)
        }
    }
    
    @IBAction func buttonCloseDidTap() {
        viewModel.finish(shouldMoveToParent: true)
    }
}
