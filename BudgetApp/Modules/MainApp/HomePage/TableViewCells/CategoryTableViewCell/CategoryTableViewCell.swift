//
//  TableViewCell.swift
//  BudgetApp
//
//  Created by Allan on 4.04.23.
//

import Foundation
import UIKit



final class CategoryTableViewCell: UITableViewCell {
    @IBOutlet weak var backgroundHeaderView: UIView!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var buttonImage: UIImageView!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel: CategoryCellViewModelProtocol!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundHeaderView.layer.cornerRadius = 12
        selectionStyle = .none
    }
    
    func setUpCollection() {
        viewModel.setUpCollectionView(with: collectionView)
        viewModel.loadData()
    }
    func setStatus(isExpanded: Bool) {
        if isExpanded {
            buttonImage.transform = CGAffineTransform(rotationAngle: .pi)
        }
    }
    
    
    func animateIndicator(_ shouldOpen: Bool) {
        var endAngle: CGFloat
        var startAngle: CGFloat
        if shouldOpen {
            endAngle = CGFloat.pi
            startAngle = .zero
        } else {
            endAngle = .zero
            startAngle = CGFloat.pi
        }
        buttonImage.transform = CGAffineTransform(rotationAngle: startAngle)
        
        UIView.animate(withDuration: 0.5) { [weak self] in
            self?.buttonImage.transform = CGAffineTransform(rotationAngle: endAngle)
        }
    }
  
}

