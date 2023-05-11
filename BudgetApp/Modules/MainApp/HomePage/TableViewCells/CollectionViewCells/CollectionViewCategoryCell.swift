//
//  MainCell.swift
//  BudgetApp
//
//  Created by Allan on 1.04.23.
//

import Foundation
import UIKit

final class CollectionViewCategoryCell: UICollectionViewCell {
    @IBOutlet  weak var nameOfCell: UILabel?
    @IBOutlet  weak var image: UIImageView?
    @IBOutlet  weak var money: UILabel?
    
    func setUp(item: Account?) {
        self.nameOfCell?.text = item?.name ?? ""
        self.image?.image = UIImage(named: item?.image ?? "creditcard")
        self.money?.text = "\(item?.sum)"

    }
}
