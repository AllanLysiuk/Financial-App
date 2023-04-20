//
//  CategoryCellAssembler.swift
//  BudgetApp
//
//  Created by Allan on 20.04.23.
//

import Foundation

final class CategoryCellAssembler {
    private init() { }
    
    static func makeVM(delegate: AddNewCategoryDelegate, elements: [CategoryItem]?, numberOfSection: Int ) -> CategoryCellViewModelProtocol {
        return CategoryCellViewModel(delegate: delegate, elements: elements, adapter: makeAdapter(), numberOfSectionInTableView: numberOfSection)
    }
    
    private static func makeAdapter() -> CollectionViewAdapterProtocol {
        return CollectionViewAdapter()
    }
}
