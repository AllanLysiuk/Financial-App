//
//  SettingsTableViewCellInfo.swift
//  BudgetApp
//
//  Created by Allan on 29.05.23.
//

import Foundation
import UIKit

final class SettingsTableViewCellInfo: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var currencyCodeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpNameLabel()
        setUpInfoLabel()
        setUpCurrencyCodeLabel()
    }
    
    private func setUpNameLabel() {
        nameLabel?.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        nameLabel?.font = UIFont(name: "Montserrat-SemiBold", size: 16)
    }
    
    private func setUpInfoLabel() {
        infoLabel?.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        infoLabel?.font = UIFont(name: "Montserrat-Medium", size: 12)
    }
    
    private func setUpCurrencyCodeLabel() {
        currencyCodeLabel?.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        currencyCodeLabel?.font = UIFont(name: "Montserrat-SemiBold", size: 32)
    }
    
}
