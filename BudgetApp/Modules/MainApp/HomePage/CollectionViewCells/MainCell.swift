//
//  MainCell.swift
//  BudgetApp
//
//  Created by Allan on 1.04.23.
//

import Foundation
import UIKit

final class MainCell: UICollectionViewCell {
    @IBOutlet private weak var nameOfCell: UILabel?
    @IBOutlet private weak var image: UIImageView?
    @IBOutlet private weak var money: UILabel?
    
    func setUp(item: CategoryItem) {
        self.nameOfCell?.text = item.nameOfCell
        self.image?.image = item.image
        self.money?.text = "\(item.money)"
    }
}
