//
//  MovementOfAccount+CoreDataProperties.swift
//  BudgetApp
//
//  Created by Allan on 5.05.23.
//
//

import Foundation
import CoreData


extension MovementOfAccount {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MovementOfAccount> {
        return NSFetchRequest<MovementOfAccount>(entityName: "MovementOfAccount")
    }

    @NSManaged public var sum: Double
    @NSManaged public var date: Date?
    @NSManaged public var whereDestination: String?
    @NSManaged public var fromWhereDestination: String?
    @NSManaged public var fromWhereRelation: Account?
    @NSManaged public var whereRelation: Account?

}

extension MovementOfAccount : Identifiable {

}
