//
//  MainScreenVM.swift
//  BudgetApp
//
//  Created by Allan on 15.03.23.
//

import UIKit

final class HomePageVM: HomePageViewModelProtocol{
    private weak var coordinator: HomePageCoordinatorProtocol?
    private var adapter: CollectionViewAdapterProtocol
    
#warning("remove force unwrap")
    var items: [Sections] = [
        .income([
            CategoryItem(nameOfCell: "Salary", image: UIImage(systemName: "banknote")!, money: 0),
            CategoryItem(nameOfCell: "Rent Apartments", image: UIImage(systemName: "creditcard")!, money: 0),
        ]),
        .wallets([
            CategoryItem(nameOfCell: "Main", image: UIImage(systemName: "bag")!, money: 0),
            CategoryItem(nameOfCell: "Wife", image: UIImage(systemName: "bag")!, money: 0),
        ]),
        .costs([
            CategoryItem(nameOfCell: "Cigars", image: UIImage(systemName: "smoke")!, money: 0),
            CategoryItem(nameOfCell: "Rent", image: UIImage(systemName: "house")!, money: 0),
        ])]
    
    init(coordinator: HomePageCoordinatorProtocol, adapter: CollectionViewAdapterProtocol){
        self.coordinator = coordinator
        self.adapter = adapter
    }
    
    func setUpCollectionView(with collectionView: UICollectionView) {
        adapter.setUpCollectionView(collectionView)
    }
    
    func loadData() {
        adapter.setUpItems(items)
    }
}
