//
//  MainScreenVM.swift
//  BudgetApp
//
//  Created by Allan on 15.03.23.
//

import UIKit

protocol HomePageDelegate: AnyObject {
    func getViewHeight() -> Double
}

final class HomePageVM: HomePageViewModelProtocol{
    private var coordinator: HomePageCoordinatorProtocol
    private var adapter: TableViewAdapterProtocol
    
    private weak var delegate: HomePageDelegate?
    private var numberOfSection: Int?
    
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
            CategoryItem(nameOfCell: "Cigars", image: UIImage(systemName: "smoke")!, money: 0),
            CategoryItem(nameOfCell: "Rent", image: UIImage(systemName: "house")!, money: 0),
            CategoryItem(nameOfCell: "Cigars", image: UIImage(systemName: "smoke")!, money: 0),
            CategoryItem(nameOfCell: "Rent", image: UIImage(systemName: "house")!, money: 0),
            
        ])]
    
    init(coordinator: HomePageCoordinatorProtocol, adapter: TableViewAdapterProtocol){
        self.coordinator = coordinator
        self.adapter = adapter
        self.adapter.setUpDelegate(self)
    }
    
    func setUpDelegate(_ delegate: HomePageDelegate) {
        self.delegate = delegate
    }
    
    func setUpCollectionView(with tableView: UITableView) {
        adapter.setUpTableView(tableView)
    }
    
    func loadData() {
        adapter.setUpItems(items)
    }
}
#warning("remove magic number")
extension HomePageVM: TableViewAdapterDelegate {
    func getViewHeight() -> Double {
        return delegate?.getViewHeight() ?? 896
    }
    
    func openAddNewCategoryVC(_ numberOfSectionInTableView: Int) {
        self.numberOfSection = numberOfSectionInTableView
        coordinator.openAddNewCategoryScene(self)
    }
}

#warning("какой здесь будет правильный дефолтный кейс")
extension HomePageVM: AddNewCategoryViewModelDelegate {
    func newCategoryCreated(name: String, image: UIImage) {
        if let numberOfSection = numberOfSection {
            var arr = items[numberOfSection].getArray
            arr.append(CategoryItem(nameOfCell: name, image: image, money: 0))
            let tmp: Sections
            switch numberOfSection {
            case 0: tmp = Sections.income(arr)
            case 1: tmp = Sections.wallets(arr)
            case 2: tmp = Sections.costs(arr)
            default: tmp = Sections.income(arr)
            }
            items[numberOfSection] = tmp
            loadData()
        }
    }
}
