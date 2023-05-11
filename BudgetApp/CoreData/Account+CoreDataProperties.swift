//
//  Account+CoreDataProperties.swift
//  BudgetApp
//
//  Created by Allan on 10.05.23.
//
//

import Foundation
import CoreData


extension Account {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Account> {
        return NSFetchRequest<Account>(entityName: "Account")
    }

    @NSManaged public var name: String?
    @NSManaged public var sum: Double
    @NSManaged public var type: String?
    @NSManaged public var image: String?

}

extension Account : Identifiable {

}
