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
    private var resControllerService: HomePageResControllerServiceProtocol
    private var notificationCenter: NotificationCenter
    private var numberOfSection: Int?
    
    var items: [Sections] = [.income([]), .wallets([]), .costs([])]
    
    init(
        coordinator: HomePageCoordinatorProtocol,
        adapter: TableViewAdapterProtocol,
        repoService: HomePageRepoServiceProtocol,
        resControllerService: HomePageResControllerServiceProtocol,
        notificationCenter: NotificationCenter
    ){
        self.coordinator = coordinator
        self.adapter = adapter
        self.repoService = repoService
        self.resControllerService = resControllerService
        self.notificationCenter = notificationCenter
        self.resControllerService.setUpDelegate(self)
        self.adapter.setUpCollectionViewDelegate(self)
    }
    
    private func setUpItemsFromDict(dict: [AccountType.RawValue : [Account]]) {
        items[0] = .income(dict[AccountType.income.rawValue] ?? [])
        items[1] = .wallets(dict[AccountType.wallet.rawValue] ?? [])
        items[2] = .costs(dict[AccountType.cost.rawValue] ?? [])
    }
    
    func setUpTableView(with tableView: UITableView) {
        adapter.setUpTableView(tableView)
    }
    
    #warning("Так можно делать или нет?")
    func loadData(dataNeedsToBeLoaded: Bool) {
        if dataNeedsToBeLoaded {
            let dict = repoService.loadInfo()
            setUpItemsFromDict(dict: dict)
        }
        adapter.setUpItems(items)
    }
    
    private func currencyChanged() {
        adapter.reloadData()
    }
    
    func initNotificationCenter() {
        notificationCenter.addObserver(self, selector: #selector(currencyChanged(_:)), name: .currencyChanged, object: nil)
    }
    
    func deinitNotificationCenter() {
        notificationCenter.removeObserver(self, name: .currencyChanged, object: nil)
    }
    
    @objc private func currencyChanged(_ notification: Notification) {
        currencyChanged()
        
    }
}

extension HomePageVM: HomePageCollectionAdapterDelegate {
    func openAddNewCategoryVC(_ numberOfSectionInTableView: Int) {
        self.numberOfSection = numberOfSectionInTableView
        var isWalletAdding = false
        if numberOfSectionInTableView == 1 {
            isWalletAdding = true
        }
        coordinator?.openAddNewCategoryScene(self, isWalletAdding: isWalletAdding)
    }
    
    func openMovementOfAccountScreen(from acc: Account, to accIndexPath: Int, isIncome: Bool) {
        let section: Sections
        if isIncome {
            section = items[1]
        } else {
            section = items[2]
        }
        let items = section.getArray
        let accTo = items[accIndexPath]
        print(accTo)
        coordinator?.openMovementOfAccountScreen(from: acc, to: accTo)
    }
}

//instead of UIimage use string
extension HomePageVM: AddNewCategoryViewModelDelegate {
    func newCategoryCreated(name: String, image: UIImage, sum: Double, considerInBalanceFlag: Bool) {
        if let numberOfSection = numberOfSection {
//            var arr = items[numberOfSection].getArray
            let type = AccountType.getTypeByIndex(index: numberOfSection)
            #warning("replace default image to name of image of type string")
            #warning("правильная ли у меня логика здесь")
            repoService.addNewAccount(name: name, type: type.rawValue, imageName: "creditcard", sum: sum, considerInBalanceFlag: considerInBalanceFlag)
//            let arr = repoService.loadInfoByType(type: type)
//          arr.append(newAccount)
//            var tmp: Sections?
//            switch numberOfSection {
//            case 0: tmp = Sections.income(arr)
//            case 1: tmp = Sections.wallets(arr)
//            case 2: tmp = Sections.costs(arr)
//            default: break
//            }
//
//            guard let tmp = tmp else { return }
//            items[numberOfSection] = tmp
            //loadData(dataNeedsToBeLoaded: false)
        }
    }
}

extension HomePageVM: ResultControllerDelegate {
    func contentDidChange(items: [AccountType.RawValue : [Account]]) {
        setUpItemsFromDict(dict: items)
        loadData(dataNeedsToBeLoaded: false)
    }
}
