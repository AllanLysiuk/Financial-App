//
//  MovementOfAccountVC.swift
//  BudgetApp
//
//  Created by Allan on 13.06.23.
//

import Foundation
import UIKit
import FSCalendar

final class MovementOfAccountVC: UIViewController {
    @IBOutlet private weak var screenLabel: UILabel!
    @IBOutlet private weak var sumNameLabel: UILabel!
    @IBOutlet private weak var sumTextField: UITextField!
    @IBOutlet private weak var leftCategoryLabel: UILabel!
    @IBOutlet private weak var leftCategoryNameLabel: UILabel!
    @IBOutlet private weak var leftCurrentSumLabel: UILabel!
    @IBOutlet private weak var rightCategoryLabel: UILabel!
    @IBOutlet private weak var rightCategoryNameLabel: UILabel!
    @IBOutlet private weak var leftImageView: UIImageView!
    @IBOutlet private weak var rightImageView: UIImageView!
    @IBOutlet private weak var closeButton: UIButton!
    @IBOutlet private weak var saveButton: UIButton!
    @IBOutlet private weak var calendarView: FSCalendar!
    
    private var viewModel: MovementOfAccountVMProtocol
    
    private var currencyCode: String = {
        let str = UserDefaults.standard.string(forKey: UserDefaultsEnum.currentCurrency.rawValue)
        let tokens = str?.parseCurrencyFromUD()
        return tokens?[1] ?? ""
    }()
    
    init(viewModel: MovementOfAccountVMProtocol){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sumTextField.delegate = self
        viewModel.setUpCalendarView(with: calendarView)
        setUPAllUI()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if parent == nil {
            viewModel.finish(shouldMoveToParent: false)
        }
    }
    
    private func setUPAllUI(){
        setUPDoneButtonKeybard()
        setupCalendarViewUI()
        setUpUI()
        fillAccFromInfo()
        fillAccToInfo()
    }
    
    private func setUPDoneButtonKeybard() {
        let keypadToolbar: UIToolbar = UIToolbar()
        keypadToolbar.items=[
            UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: textField, action: #selector(doneButtonKeyboardDidTap(_:))),
            UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        ]
        keypadToolbar.sizeToFit()
        sumTextField.inputAccessoryView = keypadToolbar
    }
    
    private func setUpUI() {
        screenLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        screenLabel.font = UIFont(name: "Montserrat-SemiBold", size: 20)
        
        sumNameLabel.textColor = UIColor(red: 0.118, green: 0.11, blue: 0.11, alpha: 0.5)
        sumNameLabel.font = UIFont(name: "Montserrat-SemiBold", size: 14)
        
        sumTextField.text = "0" + " \(currencyCode)"
        sumTextField.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        sumTextField.font = UIFont(name: "Montserrat-Bold", size: 32)
        
        leftCategoryLabel.textColor = UIColor(red: 0.118, green: 0.11, blue: 0.11, alpha: 0.5)
        leftCategoryLabel.font = UIFont(name: "Montserrat-SemiBold", size: 14)
        
        rightCategoryLabel.textColor = UIColor(red: 0.118, green: 0.11, blue: 0.11, alpha: 0.5)
        rightCategoryLabel.font = UIFont(name: "Montserrat-SemiBold", size: 14)
        
        leftCategoryNameLabel.textColor = UIColor(red: 0.118, green: 0.11, blue: 0.11, alpha: 1)
        leftCategoryNameLabel.font = UIFont(name: "Montserrat-SemiBold", size: 16)
        
        rightCategoryNameLabel.textColor = UIColor(red: 0.118, green: 0.11, blue: 0.11, alpha: 1)
        rightCategoryNameLabel.font = UIFont(name: "Montserrat-SemiBold", size: 16)
        
        leftImageView.layer.cornerRadius = 20
    
        rightImageView.layer.cornerRadius = 20
        
        leftCurrentSumLabel.textColor = UIColor(red: 0.118, green: 0.11, blue: 0.11, alpha: 0.5)
        leftCurrentSumLabel.font = UIFont(name: "Montserrat-SemiBold", size: 14)
        
        saveButton.backgroundColor = UIColor(red: 0.204, green: 0.412, blue: 0.945, alpha: 1)
        saveButton.layer.cornerRadius = 24
        saveButton.titleLabel?.text = "Save"
        saveButton.titleLabel?.font = UIFont(name: "Montserrat-SemiBold", size: 18)
        saveButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
    }
    
    private func fillAccFromInfo() {
        let accFrom = viewModel.getInfoAccFrom()
        leftImageView.image = accFrom.image
        leftCategoryLabel.text = accFrom.type
        leftCategoryNameLabel.text = accFrom.name
        leftCurrentSumLabel.text = "\(accFrom.sum)"
        setUPScreenLabel(type: accFrom.type)
    }
    
    private func fillAccToInfo() {
        let accTo = viewModel.getInfoAccTo()
        rightImageView.image = accTo.image
        rightCategoryLabel.text = accTo.type
        rightCategoryNameLabel.text = accTo.name
    }
    
    private func setUPScreenLabel(type: String) {
        if type == AccountType.income.rawValue {
            screenLabel.text = "Income"
        } else {
            screenLabel.text = "Cost"
        }
    }
    
    private func setupCalendarViewUI() {
        calendarView?.select(Date())
        calendarView?.scrollDirection = .vertical
        calendarView?.scope = .week
        calendarView?.firstWeekday = 2

        calendarView?.appearance.headerTitleFont = UIFont(name: "Montserrat-SemiBold", size: 16)
        calendarView?.appearance.headerTitleColor = UIColor(red: 0.157, green: 0.157, blue: 0.161, alpha: 1)
        calendarView?.appearance.headerMinimumDissolvedAlpha = 0
        
        calendarView?.appearance.titleFont = UIFont(name: "Montserrat-SemiBold", size: 30)
        calendarView?.appearance.titleDefaultColor =  UIColor(red: 0.118, green: 0.11, blue: 0.11, alpha: 0.5)
        calendarView?.appearance.titleSelectionColor = UIColor(red: 0.204, green: 0.412, blue: 0.945, alpha: 1)
        calendarView?.appearance.titleTodayColor = .red

        
        calendarView?.appearance.subtitleFont = UIFont(name: "Montserrat-SemiBold", size: 14)
        calendarView?.appearance.subtitleSelectionColor = UIColor(red: 0.204, green: 0.412, blue: 0.945, alpha: 1)
        calendarView?.appearance.subtitleDefaultColor = UIColor(red: 0.157, green: 0.157, blue: 0.161, alpha: 1)
        calendarView?.appearance.subtitleTodayColor = .red

        calendarView.weekdayHeight = 0.0

        calendarView?.appearance.selectionColor = .clear
        calendarView?.appearance.todayColor = .clear
    }

    
    
    @IBAction func closeButtonDidTap() {
        viewModel.finish(shouldMoveToParent: true)
    }
    
    @IBAction func saveButtonDidTap() {
        viewModel.saveButtonDidTap(date: calendarView.selectedDate ?? Date())
    }
    
    @IBAction func buttonCalendarDidTap() {
        viewModel.buttonCalendarDidTap()
    }
    
    @objc private func doneButtonKeyboardDidTap(_ sender: UIBarButtonItem) {
        sumTextField.resignFirstResponder()
    }
}

#warning("сомневаюсь в последних двух методах")
extension MovementOfAccountVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        let editableRange = NSRange(location: 0, length: currentText.count - currencyCode.count - 1)
        if editableRange.upperBound >= range.upperBound {
            return true
        }
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        if text.count <= currencyCode.count + 1 {
            textField.text?.insert("0", at: text.startIndex)
        }
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField.text?.first == "0" {
            let arbitraryValue: Int = 1
            if let newPosition = textField.position(from: textField.beginningOfDocument, offset: arbitraryValue) {
                textField.selectedTextRange = textField.textRange(from: newPosition, to: newPosition)
            }
       }
    }
}
