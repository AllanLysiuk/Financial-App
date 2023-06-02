//
//  SettingsTableViewCellDefault.swift
//  BudgetApp
//
//  Created by Allan on 31.05.23.
//

import Foundation
import UIKit

final class SettingsTableViewCellDefault: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpNameLabel()
    }
    
    private func setUpNameLabel() {
        nameLabel?.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        nameLabel?.font = UIFont(name: "Montserrat-SemiBold", size: 16)
    }
    
}
