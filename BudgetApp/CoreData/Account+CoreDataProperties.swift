//
//  Account+CoreDataProperties.swift
//  BudgetApp
//
//  Created by Allan on 28.05.23.
//
//

import Foundation
import CoreData


extension Account {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Account> {
        return NSFetchRequest<Account>(entityName: "Account")
    }

    @NSManaged public var image: String?
    @NSManaged public var name: String?
    @NSManaged public var sum: Double
    @NSManaged public var type: String?
    @NSManaged public var considerInBalanceFlag: Bool

}

extension Account : Identifiable {

}
