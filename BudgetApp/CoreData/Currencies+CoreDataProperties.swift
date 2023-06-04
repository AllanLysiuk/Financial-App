//
//  Currencies+CoreDataProperties.swift
//  BudgetApp
//
//  Created by Allan on 4.06.23.
//
//

import Foundation
import CoreData


extension Currencies {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Currencies> {
        return NSFetchRequest<Currencies>(entityName: "Currencies")
    }

    @NSManaged public var code: String?
    @NSManaged public var name: String?

}

extension Currencies : Identifiable {

}
