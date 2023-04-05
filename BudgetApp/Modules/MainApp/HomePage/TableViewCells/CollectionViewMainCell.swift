//
//  MainCell.swift
//  BudgetApp
//
//  Created by Allan on 1.04.23.
//

import Foundation
import UIKit

final class CollectionViewMainCell: UICollectionViewCell {
    @IBOutlet  weak var nameOfCell: UILabel?
    @IBOutlet  weak var image: UIImageView?
    @IBOutlet  weak var money: UILabel?
    
    func setUp(item: CategoryItem) {
        self.nameOfCell?.text = item.nameOfCell
        self.image?.image = item.image
        self.money?.text = "\(item.money)"
    }
}
