//
//  MainScreenVM.swift
//  BudgetApp
//
//  Created by Allan on 15.03.23.
//

import UIKit

final class HomePageVM: HomePageViewModelProtocol{
    private weak var coordinator: HomePageCoordinatorProtocol?
    private var adapter: TableViewAdapterProtocol
    
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
    
    func setUpTableView(with tableView: UITableView) {
        adapter.setUpTableView(tableView)
    }
    
    func loadData() {
        adapter.setUpItems(items)
    }
}

extension HomePageVM: TableViewAdapterDelegate {
    func openAddNewCategoryVC(_ numberOfSectionInTableView: Int) {
        self.numberOfSection = numberOfSectionInTableView
        coordinator?.openAddNewCategoryScene(self)
    }
}

extension HomePageVM: AddNewCategoryViewModelDelegate {
    func newCategoryCreated(name: String, image: UIImage) {
        if let numberOfSection = numberOfSection {
            var arr = items[numberOfSection].getArray
            arr.append(CategoryItem(nameOfCell: name, image: image, money: 0))
            var tmp: Sections?
            switch numberOfSection {
            case 0: tmp = Sections.income(arr)
            case 1: tmp = Sections.wallets(arr)
            case 2: tmp = Sections.costs(arr)
            default: break
            }
            
            guard let tmp = tmp else { return }
            items[numberOfSection] = tmp
            loadData()
        }
    }
}
