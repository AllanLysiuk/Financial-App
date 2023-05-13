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
    
    static func makeHomePageVC(coordinator: HomePageCoordinatorProtocol, container: Container) -> UIViewController{
        let vc = HomePageVC(viewModel: makeViewModel(coordinator: coordinator, container: container))
        return vc
    }
    
    private static func makeViewModel( coordinator: HomePageCoordinatorProtocol, container: Container) -> HomePageViewModelProtocol{
        return HomePageVM(coordinator: coordinator, adapter: makeAdapter(), repoService: makeRepoService(container: container), resControllerService: makeResultControllerService(container: container))
    }
    
    private static func makeAdapter() -> TableViewAdapterProtocol {
        return TableViewAdapter()
    }
    
    private static func makeRepoService(container: Container) -> RepositoryServiceProtocol {
        return container.resolve()
    }
    
    private static func makeResultControllerService(container: Container) -> ResultControllerServiceProtocol {
        return container.resolve()
    }
    
}
