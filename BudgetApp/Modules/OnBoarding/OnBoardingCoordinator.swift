//
//  OnBoardingCoordinator.swift
//  BudgetApp
//
//  Created by Allan on 18.03.23.
//

import Foundation
import UIKit

final class OnBoardingCoordinator: Coordinator{
    
    var childCoordinators: [Coordinator] = []
    private var rootNavigationController: UINavigationController
    private var rootCoordinator: OnBoardingRootCoordinatorProtocol
    
    init(rootNavigationController: UINavigationController, rootCoordinator: OnBoardingRootCoordinatorProtocol){
        self.rootCoordinator = rootCoordinator
        self.rootNavigationController = rootNavigationController
    }
    
    func start() {
        let vc = OnBoardingAssembler.makeOnBoardingVC(coordinator: self)
        rootNavigationController.pushViewController(vc, animated: false)
    }
    
    func finish() {
        rootNavigationController.popViewController(animated: false)
        rootCoordinator.finishedOnBoarding(self)
    }
    
    
}

extension OnBoardingCoordinator: OnBoardingCoordinatorProtocol{ }
