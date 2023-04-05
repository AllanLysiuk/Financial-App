//
//  TableViewCell.swift
//  BudgetApp
//
//  Created by Allan on 4.04.23.
//

import Foundation
import UIKit

final class TableViewCell: UITableViewCell {
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var elements: [CategoryItem]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        let cellNib = UINib(nibName: "\(CollectionViewMainCell.self)", bundle: nil)
        self.collectionView.register(cellNib, forCellWithReuseIdentifier: "\(CollectionViewMainCell.self)")
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
            return self.elements?.count ?? 0
        }
        
        // Set the data for each cell (color and color name)
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CollectionViewMainCell.self)", for: indexPath) as? CollectionViewMainCell
            cell?.nameOfCell?.text = elements?[indexPath.item].nameOfCell
            cell?.image?.image = elements?[indexPath.item].image
            cell?.money?.text = "\(elements?[indexPath.item].money ?? 0)"
            
            return cell ?? UICollectionViewCell()
        }
        
        // Add spaces at the beginning and the end of the collection view
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        }
}
