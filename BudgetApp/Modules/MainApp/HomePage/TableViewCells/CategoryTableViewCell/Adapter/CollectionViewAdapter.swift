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
        if numberOfSectionInTableView != 2 {
            collectionView?.dragDelegate = self
        }
        if numberOfSectionInTableView != 0 {
            collectionView?.dropDelegate = self
        }
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

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (elements?.count ?? 0) == indexPath.last {
            if let number = numberOfSectionInTableView {
                delegate?.openAddNewCategoryVC(number)
            }
        }
    }
}

extension CollectionViewAdapter: UICollectionViewDragDelegate {
    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        if (collectionView.cellForItem(at: indexPath) as? CollectionViewCategoryCell) != nil {
            let item = elements?[indexPath.item] ?? Account()
            let itemProvider = NSItemProvider(object: item)
            let dragItem = UIDragItem(itemProvider: itemProvider)
            dragItem.localObject = item
            return [dragItem]
        } else {
            return [UIDragItem]()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, dragPreviewParametersForItemAt indexPath: IndexPath) -> UIDragPreviewParameters? {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CollectionViewCategoryCell.self)", for: indexPath) as! CollectionViewCategoryCell
        let previewParameters = UIDragPreviewParameters()
        previewParameters.visiblePath = UIBezierPath(roundedRect: CGRect(x: cell.image?.frame.minX ?? 0, y: cell.image?.frame.minY ?? 0, width: cell.image?.frame.width ?? 60, height: cell.image?.frame.height ?? 60), cornerRadius: 30)
            return previewParameters
    }
}

extension CollectionViewAdapter: UICollectionViewDropDelegate {
    #warning("тут меня смущает повторение строчек кода со 129-142 и 164-176")
    func collectionView(_ collectionView: UICollectionView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UICollectionViewDropProposal {
        if let destinationIndexPath = destinationIndexPath {
            for (_, item) in session.items.enumerated() {
                let acc = item.localObject as? Account
                if let acc = acc {
                    if let cell = collectionView.cellForItem(at: destinationIndexPath) as? CollectionViewCategoryCell {
                        if acc.type == AccountType.income.rawValue && cell.type == AccountType.wallet.rawValue {
                            return .init(operation: .move)
                    } else if acc.type == AccountType.wallet.rawValue && cell.type == AccountType.cost.rawValue {
                        return .init(operation: .move)
                    } else {
                        return .init(operation: .cancel)
                    }
                    }
                }
            }
            if let _ = collectionView.cellForItem(at: destinationIndexPath ) as? CollectionViewAddingCell {
                return .init(operation: .cancel)
            } else {
                return .init(operation: .move)
            }
        } else {
            return .init(operation: .cancel)
        }
       
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: UICollectionViewDropCoordinator) {
        var destinationIndexPath: IndexPath
        if let indexPath = coordinator.destinationIndexPath {
            destinationIndexPath = indexPath
        } else {
            let row = collectionView.numberOfItems(inSection: 0)
            destinationIndexPath = IndexPath(item: row - 1, section: 0)
        }
        spendMoney(coordinator: coordinator, destinationIndexPath: destinationIndexPath, collectionView: collectionView)
    }
    
    private func spendMoney(coordinator: UICollectionViewDropCoordinator, destinationIndexPath: IndexPath, collectionView: UICollectionView) {
           collectionView.performBatchUpdates {
               for (_, item) in coordinator.items.enumerated() {
                    let acc = item.dragItem.localObject as? Account
                    if let acc = acc {
                        let cell = collectionView.cellForItem(at: destinationIndexPath) as? CollectionViewCategoryCell
                        if  acc.type == AccountType.income.rawValue && cell?.type == AccountType.wallet.rawValue {
                            print("From income to wallet")
                        } else if acc.type == AccountType.wallet.rawValue && cell?.type == AccountType.cost.rawValue {
                            print("From wallet to cost")
                        }
                    }
                }
            }
    }
}

