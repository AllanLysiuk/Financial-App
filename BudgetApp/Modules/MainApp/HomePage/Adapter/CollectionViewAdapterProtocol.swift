//
//  CollectionViewAdapterProtocol.swift
//  BudgetApp
//
//  Created by Allan on 1.04.23.
//

import Foundation
import UIKit

protocol CollectionViewAdapterProtocol {
    func setUpCollectionView(_ collectionView: UICollectionView)
    func setUpItems(_ items: [Sections])
    
    func reloadData()
}
