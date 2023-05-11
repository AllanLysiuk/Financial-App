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
    private var repoService: HomePageRepoServiceProtocol
    
    private var numberOfSection: Int?
    
    var items: [Sections] = [.income([]), .wallets([]), .costs([])]
    init(
        coordinator: HomePageCoordinatorProtocol,
        adapter: TableViewAdapterProtocol,
        repoService: HomePageRepoServiceProtocol
    ){
        self.coordinator = coordinator
        self.adapter = adapter
        self.repoService = repoService
        self.adapter.setUpCollectionViewDelegate(self)
    }
    
    func setUpTableView(with tableView: UITableView) {
        adapter.setUpTableView(tableView)
    }
    
    #warning("Так можно делать или нет?")
    func loadData(dataNeedsToBeLoaded: Bool) {
        if dataNeedsToBeLoaded {
        let dict = repoService.loadInfo()
        items[0] = .income(dict[AccountType.income.rawValue] ?? [])
        items[1] = .wallets(dict[AccountType.wallet.rawValue] ?? [])
        items[2] = .costs(dict[AccountType.cost.rawValue] ?? [])
        }
        adapter.setUpItems(items)
    }
}

extension HomePageVM: AddNewCategoryDelegate {
    func openAddNewCategoryVC(_ numberOfSectionInTableView: Int) {
        self.numberOfSection = numberOfSectionInTableView
        coordinator?.openAddNewCategoryScene(self)
    }
}
//instead of UIimage use string
extension HomePageVM: AddNewCategoryViewModelDelegate {
    func newCategoryCreated(name: String, image: UIImage) {
        if let numberOfSection = numberOfSection {
//            var arr = items[numberOfSection].getArray
            let type = AccountType.getTypeByIndex(index: numberOfSection)
            #warning("replace default image to name of image of type string")
            #warning("правильная ли у меня логика здесь")
            repoService.addNewAccount(name: name, type: type.rawValue, imageName: "creditcard")
            let arr = repoService.loadInfoByType(type: type)
//            arr.append(newAccount)
            var tmp: Sections?
            switch numberOfSection {
            case 0: tmp = Sections.income(arr)
            case 1: tmp = Sections.wallets(arr)
            case 2: tmp = Sections.costs(arr)
            default: break
            }

            guard let tmp = tmp else { return }
            items[numberOfSection] = tmp
            loadData(dataNeedsToBeLoaded: false)
        }
    }
}
