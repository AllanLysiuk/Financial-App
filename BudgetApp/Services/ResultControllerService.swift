//
//  ResultControllerService.swift
//  BudgetApp
//
//  Created by Allan on 13.05.23.
//

import Foundation
import CoreData

protocol ResultControllerDelegate: AnyObject {
    func contentDidChange(items: [AccountType.RawValue : [Account]])
}

final class ResultControllerService: NSObject {
    
    private weak var delegate: ResultControllerDelegate?
    private var accounts: [Account] = []
    
    private lazy var frc: NSFetchedResultsController<Account> = {
        let request = Account.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor.init(key: "name", ascending: true)]
        let frc = NSFetchedResultsController(fetchRequest: request, managedObjectContext: CoreDataStack.shared.backgroundContext, sectionNameKeyPath: nil, cacheName: nil)
        return frc
    }()
    
    private func parseAccountsByTypes(accounts: [Account]) -> [AccountType.RawValue : [Account]] {
        var dict: [AccountType.RawValue : [Account]] = [AccountType.income.rawValue:[], AccountType.wallet.rawValue:[], AccountType.cost.rawValue:[]]
        accounts.forEach { acc in
            #warning("Форс анврап норм ли он здесь?")
            dict[acc.type!]?.append(acc)
        }
        return dict
    }
    
    private func updateInfo() {
        try? frc.performFetch()
        accounts = frc.fetchedObjects ?? []
        delegate?.contentDidChange(items: parseAccountsByTypes(accounts: accounts))
    }
}

extension ResultControllerService: ResultControllerServiceProtocol {
    func setUpDelegate(_ delegate: ResultControllerDelegate) {
        self.delegate = delegate
        frc.delegate = self
        try? frc.performFetch()
    }
}

extension ResultControllerService: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        DispatchQueue.main.async {
            self.updateInfo()
        }
       
    }
}
