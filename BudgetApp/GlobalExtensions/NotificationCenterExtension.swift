//
//  NotificationCenterExtension.swift
//  BudgetApp
//
//  Created by Allan on 7.06.23.
//

import Foundation

extension Notification.Name {
    static var currencyChanged: Notification.Name {
        return .init(rawValue: "Currency.changed")
    }
}
