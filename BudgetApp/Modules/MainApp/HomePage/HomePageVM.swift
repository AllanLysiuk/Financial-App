//
//  MainScreenVM.swift
//  BudgetApp
//
//  Created by Allan on 15.03.23.
//

import Foundation

final class HomePageVM: HomePageViewModelProtocol{
    private weak var coordinator: HomePageCoordinatorProtocol?
    
    init(coordinator: HomePageCoordinatorProtocol){
        self.coordinator = coordinator
    }
}
