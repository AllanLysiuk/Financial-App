//
//  TableViewCell.swift
//  BudgetApp
//
//  Created by Allan on 4.04.23.
//

import Foundation
import UIKit

final class TableViewCell: UITableViewCell {
    @IBOutlet weak var backgroundHeaderView: UIView!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var buttonImage: UIImageView!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var elements: [CategoryItem]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        let categoryCellNib = UINib(nibName: "\(CollectionViewCategoryCell.self)", bundle: nil)
        self.collectionView.register(categoryCellNib, forCellWithReuseIdentifier: "\(CollectionViewCategoryCell.self)")
        
        let addingCellNib = UINib(nibName: "\(CollectionViewAddingCell.self)", bundle: nil)
        self.collectionView.register(addingCellNib, forCellWithReuseIdentifier: "\(CollectionViewAddingCell.self)")
        
        backgroundHeaderView.layer.cornerRadius = 12
    }
    
    func setStatus(isExpanded: Bool)
       {
           if isExpanded
           {
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
           completion: { (success) in
               // do anything
           }
       }

}


extension TableViewCell: UICollectionViewDelegate {
    func updateCellWith(elements: [CategoryItem]) {
            self.elements = elements
            self.collectionView.reloadData()
        }
}

extension TableViewCell: UICollectionViewDataSource {
    
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return (self.elements?.count ?? 0) + 1
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            if (elements?.count ?? 0) != indexPath.last {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CollectionViewCategoryCell.self)", for: indexPath) as? CollectionViewCategoryCell
                cell?.setUp(item: elements?[indexPath.item])
                return cell ?? UICollectionViewCell()
            } else{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CollectionViewAddingCell.self)", for: indexPath) as? CollectionViewAddingCell
                cell?.layer.cornerRadius = 10
                return cell ?? UICollectionViewCell()
            }
        }
        
        // Add spaces at the beginning and the end of the collection view
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
