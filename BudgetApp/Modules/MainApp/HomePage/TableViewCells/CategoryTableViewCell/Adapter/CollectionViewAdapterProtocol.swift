//
//  CollectionViewAdapterProtocol.swift
//  BudgetApp
//
//  Created by Allan on 20.04.23.
//

import Foundation
import UIKit

protocol CollectionViewAdapterProtocol {
    func setUpCollectionView(_ collectionView: UICollectionView)
    func setUpItems(_ items: [CategoryItem]?)
    func setUpNumberOfSectionTableView(numberOfSection: Int)
    func setUpDelegate(_ delegate: AddNewCategoryDelegate)
    func reloadData()
}
