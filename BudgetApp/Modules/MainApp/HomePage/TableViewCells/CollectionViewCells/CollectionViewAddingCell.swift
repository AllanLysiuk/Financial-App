//
//  CollectionViewAddingCell.swift
//  BudgetApp
//
//  Created by Allan on 11.04.23.
//

import Foundation
import UIKit

final class CollectionViewAddingCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet private weak var backgroundCellView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundCellView.clipsToBounds = false
        backgroundCellView.layer.shadowOpacity = 1
        backgroundCellView.layer.shadowRadius = 8
        backgroundCellView.layer.cornerRadius = 30
        backgroundCellView.layer.shadowOffset = CGSize(width: 1, height: 1)
        backgroundCellView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.12).cgColor
        backgroundCellView.layer.shadowPath = UIBezierPath(roundedRect: backgroundCellView.bounds, cornerRadius: 30).cgPath
        self.imageView.clipsToBounds = true
        self.imageView.layer.cornerRadius = 30
    }
}
