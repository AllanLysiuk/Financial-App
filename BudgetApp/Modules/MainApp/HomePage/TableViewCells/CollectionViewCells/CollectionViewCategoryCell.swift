//
//  MainCell.swift
//  BudgetApp
//
//  Created by Allan on 1.04.23.
//

import Foundation
import UIKit

final class CollectionViewCategoryCell: UICollectionViewCell {
    @IBOutlet weak var nameOfCell: UILabel?
    @IBOutlet weak var image: UIImageView?
    @IBOutlet weak var money: UILabel?
    
    func setUp(item: Account?) {
        self.nameOfCell?.text = item?.name ?? ""
        self.image?.image = UIImage(systemName: item?.image ?? "creditcard")
        self.money?.text = "\(item?.sum ?? 0) "
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpNameLabel()
        setUpMoneyLabel()
    }
    
    private func setUpNameLabel() {
        nameOfCell?.backgroundColor = .white
        nameOfCell?.textColor = UIColor(red: 0.118, green: 0.11, blue: 0.11, alpha: 0.5)
        nameOfCell?.font = UIFont(name: "Montserrat-SemiBold", size: 14)
    }
    private func setUpMoneyLabel() {
        money?.backgroundColor = .white
        money?.textColor = UIColor(red: 0.118, green: 0.11, blue: 0.11, alpha: 1)
        money?.font = UIFont(name: "Montserrat-SemiBold", size: 14)
    }
}
