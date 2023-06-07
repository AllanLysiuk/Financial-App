//
//  CollectionViewAdapter.swift
//  BudgetApp
//
//  Created by Allan on 1.04.23.
//

import Foundation
import UIKit

final class TableViewAdapter: NSObject {
    
    private enum SizeOfCell {
        static let elementsInRow: Double = 3
        static let lineInset: Double = 22
        static let heightOfCell: Double = 110
        static let heightOfHeader: Double = 60
    }
    
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
        let collectionViewHeight = (ceil(amountOfElements / SizeOfCell.elementsInRow) * SizeOfCell.heightOfCell)
        let insetsBetweenElements = ((ceil(amountOfElements / SizeOfCell.elementsInRow) - 1) * SizeOfCell.lineInset)
        return CGFloat(collectionViewHeight + SizeOfCell.heightOfHeader + insetsBetweenElements + 12)
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

//MARK: TableView Delegate
extension TableViewAdapter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if shouldHide[indexPath.row] {
            return SizeOfCell.heightOfHeader
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

//MARK: TableView DataSource
extension TableViewAdapter: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(CategoryTableViewCell.self)") as? CategoryTableViewCell
        
        cell?.headerLabel.text = sections[indexPath.row].headerTitles()
        let section = sections[indexPath.row]
        let items = section.getArray
        let sum = items.reduce(0.0) { partialResult, acc in
            if acc.considerInBalanceFlag {
               return partialResult + acc.sum
            }
            return partialResult
        }
        let currentCurrency = UserDefaults.standard.string(forKey: UserDefaultsEnum.currentCurrency.rawValue)
        let tokens = currentCurrency?.parseCurrencyFromUD()
        cell?.amountLabel.text = "\(sum) \(tokens?[1] ?? "")"
        
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
