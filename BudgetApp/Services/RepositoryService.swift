//
//  RepositoryService.swift
//  BudgetApp
//
//  Created by Allan on 9.05.23.
//

import Foundation
import CoreData

enum AccountType: String {
    case income = "Income"
    case wallet = "Wallet"
    case cost = "Cost"
    
    static func getTypeByIndex(index: Int) -> AccountType {
        switch index {
        case 0:
            return .income
        case 1:
            return .wallet
        case 2:
            return .cost
        default:
            assert(false, "Wrong index")
        }
    }
}

final class RepositoryService: RepositoryServiceProtocol {
    
    func loadInfo() -> [AccountType.RawValue : [Account]] {
//        let userDidChangeCoreData = UserDefaults.standard.bool(forKey: UserDefaultsEnum.userDidChangeCoreData.rawValue)
//        if !userDidChangeCoreData {
//            createDefaultAccounts()
//        }
        let request = Account.fetchRequest()
        request.returnsObjectsAsFaults = false
        let accounts = try? CoreDataStack.shared.mainContext.fetch(request)
        if  let accounts = accounts, accounts.isEmpty {
            createDefaultAccounts()
            
        }
        return parseAccountsByTypes(accounts: accounts ?? [])
    }
    
    #warning("Нужна ли мне отдельная функция для загрузки только одного типа или кор дата быстрая и можно сразу грузить все")
    #warning("Нужно ли мне здесь при пустом массиве создавать дефолтные акки или я делаю вид что эта функция будет вызываться только если акки созданы. Нужна ли для этого здесь проверка чтобы чебя обезопасить")
    func loadInfoByType(type: AccountType) -> [Account] {
        let request = Account.fetchRequest()
        request.predicate = NSPredicate(format: "\(#keyPath(Account.type)) == %@", type.rawValue)
        request.returnsObjectsAsFaults = false
        let accounts = try? CoreDataStack.shared.mainContext.fetch(request)
//        if accounts == nil || ((accounts?.isEmpty) != nil) {
//            createDefaultAccounts()
//        }
        return accounts ?? []
    }
    
    #warning("можно ли возвращать так при создании нового обджекта")
    #warning("можно ли newAccount сделать опционалом?")
    #warning("можно ли форс анврапить в этой ситуации")
    func addNewAccount(name: String, type: String, imageName: String, sum: Double, considerInBalanceFlag: Bool) { //-> Account {
        let context = CoreDataStack.shared.backgroundContext
        //context.mergePolicy
        //var newAccount: Account?
        context.perform {
           let newAccount = Account(context: context)
            newAccount.sum = sum
            newAccount.name = name
            newAccount.type = type
            newAccount.image = imageName
            newAccount.considerInBalanceFlag = considerInBalanceFlag
            CoreDataStack.shared.saveContext(context: context)
        }
//        #warning("Во всех методах где меняется кор дата добавить обновление юзер дефолтс")
//        let ud = UserDefaults()
//        ud.set(true, forKey: UserDefaultsEnum.userDidChangeCoreData.rawValue)
      //  return newAccount!
    }
    
    //MARK: Private functions
    private func createDefaultAccounts() {
        addNewAccount(name: "Salary", type: AccountType.income.rawValue, imageName: "creditcard", sum: 0, considerInBalanceFlag: true)
        
        addNewAccount(name: "Cash", type: AccountType.wallet.rawValue, imageName: "banknote", sum: 0, considerInBalanceFlag: true)
        #warning("replace default images")
        addNewAccount(name: "Rent", type: AccountType.cost.rawValue, imageName: "house", sum: 0, considerInBalanceFlag: true)
        addNewAccount(name: "Utilities", type: AccountType.cost.rawValue, imageName: "creditcard", sum: 0, considerInBalanceFlag: true)
        addNewAccount(name: "Food", type: AccountType.cost.rawValue, imageName: "creditcard", sum: 0, considerInBalanceFlag: true)
        addNewAccount(name: "Entertainments", type: AccountType.cost.rawValue, imageName: "creditcard", sum: 0, considerInBalanceFlag: true)
        addNewAccount(name: "Transport", type: AccountType.cost.rawValue, imageName: "creditcard", sum: 0, considerInBalanceFlag: true)
    }
    
    #warning("Нужен ли мне отдельный парсер сервис потому что такая же функция есть в резалт контроллер сервисе")
    private func parseAccountsByTypes(accounts: [Account]) -> [AccountType.RawValue : [Account]] {
        var dict: [AccountType.RawValue : [Account]] = [AccountType.income.rawValue:[], AccountType.wallet.rawValue:[], AccountType.cost.rawValue:[]]
        accounts.forEach { acc in
            #warning("Форс анврап норм ли он здесь?")
            dict[acc.type!]?.append(acc)
        }
        return dict
    }
}

extension RepositoryService {
    func saveCurrenciesToCoreData(items: [CurrencyElement]) {
        let context = CoreDataStack.shared.backgroundContext
        for elem in items {
            context.perform {
                let newCurrency = Currencies(context: context)
                newCurrency.name = elem.value
                newCurrency.code = elem.key
                CoreDataStack.shared.saveContext(context: context)
            }
        }
    }
    
    func loadCurrenciesFromCoreData() -> [CurrencyElement] {
        let request = Currencies.fetchRequest()
        request.returnsObjectsAsFaults = false
        let currencies = try? CoreDataStack.shared.mainContext.fetch(request)
        var items: [CurrencyElement] = []
        currencies?.forEach({ acc in
            items.append(CurrencyElement(key: acc.code!, value: acc.name!))
        })
        return items
    }
}
