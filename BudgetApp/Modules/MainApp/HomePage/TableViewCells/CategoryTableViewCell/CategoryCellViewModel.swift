//
//  CategoryCellViewModel.swift
//  BudgetApp
//
//  Created by Allan on 20.04.23.
//

import UIKit

final class CategoryCellViewModel: CategoryCellViewModelProtocol {
    
    private var elements: [CategoryItem]?
    private var adapter: CollectionViewAdapterProtocol
    
    init(delegate: AddNewCategoryDelegate, elements: [CategoryItem]?, adapter: CollectionViewAdapterProtocol, numberOfSectionInTableView: Int) {
        self.elements = elements
        self.adapter = adapter
        self.adapter.setUpNumberOfSectionTableView(numberOfSection: numberOfSectionInTableView)
        self.adapter.setUpDelegate(delegate)
    }
    
    func setUpCollectionView(with collectionView: UICollectionView) {
        adapter.setUpCollectionView(collectionView)
    }
    
    func loadData() {
        adapter.setUpItems(elements)
    }
    

}
