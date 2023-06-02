//
//  CurrencyTableViewCell.swift
//  BudgetApp
//
//  Created by Allan on 2.06.23.
//

import Foundation
import UIKit

final class CurrencyTableViewCell: UITableViewCell {
    @IBOutlet weak var currencyNameLabel: UILabel!
    @IBOutlet weak var currencyCodeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpCurrencyNameLabel()
        setUpCurrencyCodeLabel()
    }
    
    private func setUpCurrencyNameLabel() {
        currencyNameLabel?.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        currencyNameLabel?.font = UIFont(name: "Montserrat-SemiBold", size: 16)
    }
    
    private func setUpCurrencyCodeLabel() {
        currencyCodeLabel?.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        currencyCodeLabel?.font = UIFont(name: "Montserrat-SemiBold", size: 24)
    }
}
