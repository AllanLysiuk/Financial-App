//
//  CollectionViewAdapter.swift
//  BudgetApp
//
//  Created by Allan on 1.04.23.
//

import Foundation
import UIKit

protocol TableViewAdapterDelegate: AnyObject {
    func getViewHeight() -> Double
}

final class TableViewAdapter: NSObject {
    private var heightOfCells: [CGFloat] = [0, 0, 0]
    private weak var tableView: UITableView?
    private var sections: [Sections] = []
    
    private weak var delegate: TableViewAdapterDelegate?
    
    private func setUpTableView() {
        tableView?.delegate = self
        tableView?.dataSource = self
        registerCells()
        
    }
    
    private func registerCells() {
        let nib1 = UINib(nibName: "\(TableViewCell.self)", bundle: nil)
        tableView?.register(nib1, forCellReuseIdentifier: "\(TableViewCell.self)")
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
    
}

//MARK: CollectionView DataSource
extension TableViewAdapter: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections.count
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let viewHeight = delegate?.getViewHeight()
        let amountOfElements: Double = Double(sections[indexPath.row].rowCount)
        let elementsInRow: Double = 3
        let collectionViewHeight = (ceil(amountOfElements / elementsInRow) * 100)
        let insetsBetweenElements = (ceil(amountOfElements / elementsInRow) * 10)
        let heightOfHeader: Double = 60
        
        if indexPath.row != 2 {
            if  amountOfElements < elementsInRow {
                heightOfCells[indexPath.row] = 160
                return heightOfCells[indexPath.row]
            }
            heightOfCells[indexPath.row] = CGFloat(collectionViewHeight + heightOfHeader + insetsBetweenElements)
            return heightOfCells[indexPath.row]
        } else {
            var collectionHeight = CGFloat(collectionViewHeight + heightOfHeader + insetsBetweenElements)
            let heightOfTable = 2 * heightOfHeader + heightOfCells[0] + heightOfCells[1] + collectionHeight
            if let viewHeight = viewHeight, heightOfTable < viewHeight {
                collectionHeight += viewHeight - heightOfTable
                return collectionHeight
            }
            return collectionHeight
        }
      }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(TableViewCell.self)") as? TableViewCell
       
        cell?.amountLabel.text = "\(indexPath.row)"
        cell?.headerLabel.text = sections[indexPath.row].headerTitles()
        let section = sections[indexPath.row]
        cell?.updateCellWith(elements: section.getArray)
        return cell ?? UITableViewCell()
    }
    
}

