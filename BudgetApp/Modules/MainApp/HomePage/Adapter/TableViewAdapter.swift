//
//  CollectionViewAdapter.swift
//  BudgetApp
//
//  Created by Allan on 1.04.23.
//

import Foundation
import UIKit
#warning("Можно ли использовать такой енам")
enum SizeOfCell: Double {
    case elementsInRow = 5
    case lineInset = 10
    case heightOfCell = 90
    case heightOfHeader = 60
}

//protocol TableViewAdapterDelegate: AnyObject {
//
//}

final class TableViewAdapter: NSObject {    
//    private var heightOfCells: [CGFloat] = [0, 0, 0]
    private weak var tableView: UITableView?
    private var sections: [Sections] = []
    
    private weak var delegate: AddNewCategoryDelegate?
    private var shouldHide: [Bool] = [Bool].init(repeating: false, count: 3)
    var shouldAnimate: [IndexPath] = []
    
    private func setUpTableView() {
        tableView?.delegate = self
        tableView?.dataSource = self
        registerCells()
        
    }
    
    private func registerCells() {
        let nib1 = UINib(nibName: "\(CategoryTableViewCell.self)", bundle: nil)
        tableView?.register(nib1, forCellReuseIdentifier: "\(CategoryTableViewCell.self)")
    }
    
    private func calculateHeightOfCell(_ indexPath: IndexPath) -> CGFloat {
        let amountOfElements: Double = Double(sections[indexPath.row].rowCount + 1)
        let collectionViewHeight = (ceil(amountOfElements / SizeOfCell.elementsInRow.rawValue ) * SizeOfCell.heightOfCell.rawValue)
        let insetsBetweenElements = ((ceil(amountOfElements / SizeOfCell.elementsInRow.rawValue) - 1) * SizeOfCell.lineInset.rawValue)
        return CGFloat(collectionViewHeight + SizeOfCell.heightOfHeader.rawValue + insetsBetweenElements)
    }
}

//MARK: Adapter Protocol
extension TableViewAdapter: TableViewAdapterProtocol {
    func setUpCollectionViewDelegate(_ delegate: AddNewCategoryDelegate) {
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
            if let cell = cell as? CategoryTableViewCell, shouldAnimate.firstIndex(of: indexPath) != nil {
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(CategoryTableViewCell.self)") as? CategoryTableViewCell
        cell?.amountLabel.text = "\(indexPath.row)"
        cell?.headerLabel.text = sections[indexPath.row].headerTitles()
        let section = sections[indexPath.row]
        #warning("так норм писать или нет")
        if let delegate = delegate {
            let vm = CategoryCellAssembler.makeVM(delegate: delegate, elements: section.getArray, numberOfSection: indexPath.row)
            cell?.viewModel = vm
            cell?.setUpCollection()
        }
  
        return cell ?? UITableViewCell()
    }
    
}


//extension TableViewAdapter: AddNewCategoryDelegate {
// 
//}
