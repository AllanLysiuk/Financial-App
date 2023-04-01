//
//  MainSceneAssembler.swift
//  BudgetApp
//
//  Created by Allan on 15.03.23.
//

import Foundation
import UIKit

final class HomePageAssembler{
    private init(){ }
    
    static func makeHomePageVC(coordinator: HomePageCoordinatorProtocol) -> UIViewController{
        let vc = HomePageVC(viewModel: makeViewModel(coordinator: coordinator))
        return vc
    }
    
    private static func makeViewModel( coordinator: HomePageCoordinatorProtocol) -> HomePageViewModelProtocol{
        return HomePageVM(coordinator: coordinator, adapter: makeAdapter())
    }
    
    private static func makeAdapter() -> CollectionViewAdapterProtocol {
        return CollectionViewAdapter()
    }
    
}
