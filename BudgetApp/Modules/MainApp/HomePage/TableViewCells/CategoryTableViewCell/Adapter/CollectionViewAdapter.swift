//
//  CollectionViewAdapter.swift
//  BudgetApp
//
//  Created by Allan on 20.04.23.
//

import Foundation
import UIKit

protocol AddNewCategoryDelegate: AnyObject {
    func openAddNewCategoryVC(_ numberOfSectionInTableView: Int)
}

final class CollectionViewAdapter: NSObject {
    private weak var collectionView: UICollectionView?
    private var elements: [Account]?
    private var numberOfSectionInTableView: Int?
    private weak var delegate: AddNewCategoryDelegate?
    
    //MARK: Private functions
    private func setUpCollectionView() {
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
        registerCells()
    }
    
    private func registerCells() {
        let categoryCellNib = UINib(nibName: "\(CollectionViewCategoryCell.self)", bundle: nil)
        self.collectionView?.register(categoryCellNib, forCellWithReuseIdentifier: "\(CollectionViewCategoryCell.self)")
        
        let addingCellNib = UINib(nibName: "\(CollectionViewAddingCell.self)", bundle: nil)
        self.collectionView?.register(addingCellNib, forCellWithReuseIdentifier: "\(CollectionViewAddingCell.self)")
    }
}
//MARK: Adapter Protocol
extension CollectionViewAdapter: CollectionViewAdapterProtocol {
    func setUpDelegate(_ delegate: AddNewCategoryDelegate) {
        self.delegate = delegate
    }
    
    func setUpCollectionView(_ collectionView: UICollectionView) {
        self.collectionView = collectionView
        setUpCollectionView()
    }
    
    func setUpItems(_ items: [Account]?) {
        self.elements = items ?? []
        reloadData()
    }
    
    func reloadData() {
        collectionView?.reloadData()
    }
    
    func setUpNumberOfSectionTableView(numberOfSection: Int) {
        self.numberOfSectionInTableView = numberOfSection
    }
}

//MARK: CollectionView Delegate
extension CollectionViewAdapter: UICollectionViewDelegate {
    
}

//MARK: CollectionView DataSource
extension CollectionViewAdapter: UICollectionViewDataSource {
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
//            cell?.layer.cornerRadius = 10
            return cell ?? UICollectionViewCell()
        }
    }
    
    // Add spaces at the beginning and the end of the collection view
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
//    }
    #warning("правильно ли я предаю делегаты или нужно сначала передавть во вью модель")
func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    if (elements?.count ?? 0) == indexPath.last {
        if let number = numberOfSectionInTableView {
            delegate?.openAddNewCategoryVC(number)
        }
    }
}
}
