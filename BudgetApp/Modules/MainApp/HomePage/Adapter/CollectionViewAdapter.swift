//
//  CollectionViewAdapter.swift
//  BudgetApp
//
//  Created by Allan on 1.04.23.
//

import Foundation
import UIKit

final class CollectionViewAdapter: NSObject {
    
    private weak var collectionView: UICollectionView?
    private var sections: [Sections] = []
    
    private func setUpCollectionView() {
        collectionView?.delegate = self
        collectionView?.dataSource = self
        registerCells()
        
    }
    
    private func registerCells() {
        let nib = UINib(nibName: "\(SectionHeader.self)", bundle: nil)
        collectionView?.register(nib, forSupplementaryViewOfKind: "header", withReuseIdentifier: "\(SectionHeader.self)")
//        UICollectionView.elementKindSectionHeader
        let nib1 = UINib(nibName: "\(MainCell.self)", bundle: nil)
        collectionView?.register(nib1, forCellWithReuseIdentifier: "\(MainCell.self)")
    }
}

//MARK: Adapter Protocol
extension CollectionViewAdapter: CollectionViewAdapterProtocol {
    func setUpCollectionView(_ collectionView: UICollectionView) {
        self.collectionView = collectionView
        setUpCollectionView()
    }

    func setUpItems(_ items: [Sections]) {
        self.sections = items
        reloadData()
    }
    
    func reloadData() {
        collectionView?.reloadData()
    }
}

//MARK: CollectionView Delegate
extension CollectionViewAdapter: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "\(SectionHeader.self)", for: indexPath) as? SectionHeader
        let section = indexPath.section
        
        sectionHeader?.sectionHeaderLabel.text = sections[section].headerTitles()
        return sectionHeader ?? UICollectionReusableView()
    }
    
    
}

//MARK: CollectionView DataSource
extension CollectionViewAdapter: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].rowCount
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(MainCell.self)", for: indexPath) as! MainCell
        
        let section = sections[indexPath.section]
        let sectionItems = section.getArray
        cell.setUp(item: sectionItems[indexPath.row])
        return cell
    }
    
    
}

extension CollectionViewAdapter: UICollectionViewDelegateFlowLayout {

}
