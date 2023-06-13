//
//  MainSceneCoordinatorProtocol.swift
//  BudgetApp
//
//  Created by Allan on 15.03.23.
//

import Foundation

protocol HomePageCoordinatorProtocol: AnyObject {
    func finish()
    
    func openAddNewCategoryScene(_ delegate: AddNewCategoryViewModelDelegate, isWalletAdding: Bool)
    func openMovementOfAccountScreen(from accFrom: Account, to accTo: Account)
}
