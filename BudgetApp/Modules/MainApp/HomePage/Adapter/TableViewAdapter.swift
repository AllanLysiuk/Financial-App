//
//  CollectionViewAdapter.swift
//  BudgetApp
//
//  Created by Allan on 1.04.23.
//

import Foundation
import UIKit

enum SizeOfCell: Double {
    case elementsInRow = 3
    case lineInset = 10
    case heightOfCell = 100
    case heightOfHeader = 60
}

protocol TableViewAdapterDelegate: AnyObject {
    func getViewHeight() -> Double
    func openAddNewCategoryVC()
}

final class TableViewAdapter: NSObject {
    private var heightOfCells: [CGFloat] = [0, 0, 0]
    private weak var tableView: UITableView?
    private var sections: [Sections] = []
    
    private weak var delegate: TableViewAdapterDelegate?
    private var shouldHide: [Bool] = [Bool].init(repeating: false, count: 3)
    var shouldAnimate: [IndexPath] = []
    
    private func setUpTableView() {
        tableView?.delegate = self
        tableView?.dataSource = self
        registerCells()
    }
    
    private func registerCells() {
        let nib1 = UINib(nibName: "\(TableViewCell.self)", bundle: nil)
        tableView?.register(nib1, forCellReuseIdentifier: "\(TableViewCell.self)")
    }
    
    private func calculateHeightOfCell(_ indexPath: IndexPath) -> CGFloat {
        let viewHeight = delegate?.getViewHeight()
        let amountOfElements: Double = Double(sections[indexPath.row].rowCount)
        
        let collectionViewHeight = (ceil(amountOfElements / SizeOfCell.elementsInRow.rawValue ) * SizeOfCell.heightOfCell.rawValue)
        let insetsBetweenElements = (ceil(amountOfElements / SizeOfCell.elementsInRow.rawValue) * SizeOfCell.lineInset.rawValue)
        
        if indexPath.row != 2 {
            if  amountOfElements < SizeOfCell.elementsInRow.rawValue {
                heightOfCells[indexPath.row] = SizeOfCell.heightOfCell.rawValue + SizeOfCell.heightOfHeader.rawValue
                return heightOfCells[indexPath.row]
            }
            heightOfCells[indexPath.row] = CGFloat(collectionViewHeight + SizeOfCell.heightOfHeader.rawValue + insetsBetweenElements)
            return heightOfCells[indexPath.row]
        } else {
            var collectionHeight = CGFloat(collectionViewHeight + SizeOfCell.heightOfHeader.rawValue + insetsBetweenElements)
            let heightOfTable = 2 * SizeOfCell.heightOfHeader.rawValue + heightOfCells[0] + heightOfCells[1] + collectionHeight
            if let viewHeight = viewHeight, heightOfTable < viewHeight {
                collectionHeight += viewHeight - heightOfTable
                return collectionHeight
            }
            return collectionHeight
        }
    }
}

//MARK: Adapter Protocol
extension TableViewAdapter: TableViewAdapterProtocol {
    func setUpDelegate(_ delegate: TableViewAdapterDelegate) {
        self.delegate = delegate
    }
    
    func setUpTableView(_ tableView: UITableView) {
        self.tableView = tableView
        setUpTableView()
    }

    func setUpItems(_ items: [Sections]) {
        self.sections = items
        reloadData()
    }
    
    func reloadData() {
        tableView?.reloadData()
    }
}

//MARK: CollectionView Delegate
extension TableViewAdapter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if shouldHide[indexPath.row] {
            return SizeOfCell.heightOfHeader.rawValue
        }
       return calculateHeightOfCell(indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.shouldHide[indexPath.row] = !self.shouldHide[indexPath.row]
        shouldAnimate.append(indexPath)
        tableView.reloadRows(at: [indexPath], with: .fade)
    }
    
    func tableView(_ tableView: UITableView,
                       willDisplay cell: UITableViewCell,
                       forRowAt indexPath: IndexPath) {
            if let cell = cell as? TableViewCell, shouldAnimate.firstIndex(of: indexPath) != nil {
                cell.animateIndicator(shouldHide[indexPath.row])
            }
        }
}

//MARK: CollectionView DataSource
extension TableViewAdapter: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(TableViewCell.self)") as? TableViewCell
        cell?.amountLabel.text = "\(indexPath.row)"
        cell?.headerLabel.text = sections[indexPath.row].headerTitles()
        let section = sections[indexPath.row]
        cell?.setUpDelegate(self)
        cell?.updateCellWith(elements: section.getArray)
        return cell ?? UITableViewCell()
    }
    
}


extension TableViewAdapter: AddNewCategoryDelegate {
    func openAddNewCategoryVC() {
        self.delegate?.openAddNewCategoryVC()
    }
}
