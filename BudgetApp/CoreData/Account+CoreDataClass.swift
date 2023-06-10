//
//  Account+CoreDataClass.swift
//  BudgetApp
//
//  Created by Allan on 5.05.23.
//
//

import Foundation
import CoreData

@objc(Account)
public class Account: NSManagedObject {

}

#warning("Можно ли так делать?")
extension Account: NSItemProviderWriting {
    public static var writableTypeIdentifiersForItemProvider: [String] {
        return ["Account"]
    }
    
    public func loadData(withTypeIdentifier typeIdentifier: String, forItemProviderCompletionHandler completionHandler: @escaping (Data?, Error?) -> Void) -> Progress? {
        return nil
    }
    
    
}
