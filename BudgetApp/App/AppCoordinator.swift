//
//  AppCoordinator.swift
//  BudgetApp
//
//  Created by Allan on 28.02.23.
//

import Foundation
import UIKit

final class AppCoordinator: Coordinator {
    private var windowScene: UIWindowScene
    private var window: UIWindow?
    var childCoordinators: [Coordinator] = []
    
    init (windowScene: UIWindowScene) {
        self.windowScene = windowScene
    }
    
    func start() {
//        let isRegistered = true
        let isRegistered = UserDefaults.standard.bool(forKey: "isRegistered")
//       let shouldShowOnboarding = false
        let shouldShowOnboarding = UserDefaults.standard.bool(forKey: "shouldShowOnboarding")
        
        if !isRegistered {
            openLoginScene()
        } else if !shouldShowOnboarding {
           openOnBoardingScene()
        } else {
            openMainScene()
        }
        window?.makeKeyAndVisible()
    }
    
    func finish() {

    }
    
    private func openLoginScene() {
        let loginWindow = UIWindow(windowScene: windowScene)
        let nc = UINavigationController()
        loginWindow.rootViewController = nc
        
        let loginCoordinator = LoginCoordinator(rootNavigationController: nc, rootCoordinator: self)
        childCoordinators.append(loginCoordinator)
        loginCoordinator.start()
        
        window = loginWindow
    }
    
    private func openMainScene() {
        let ud = UserDefaults()
        ud.set(false, forKey: "isRegistered")
        
        let mainWindow = UIWindow(windowScene: windowScene)
        let nc = UINavigationController()
        mainWindow.rootViewController = nc
        
       let tabBarCoordinator = TabBarCoordinator(rootNavigationController: nc, rootCoordinator: self)
        childCoordinators.append(tabBarCoordinator)
        tabBarCoordinator.start()
        window = mainWindow
    }
    
    private func openOnBoardingScene() {
        let onBoardingWindow = UIWindow(windowScene: windowScene)
        let nc = UINavigationController()
        onBoardingWindow.rootViewController = nc
        
       let coordinator = OnBoardingCoordinator(rootNavigationController: nc, rootCoordinator: self)
        childCoordinators.append(coordinator)
        coordinator.start()
        self.window = onBoardingWindow
    }
    
}


extension AppCoordinator: LoginRootCoordinatorController {
    func finishedLogging(_ coordinator: Coordinator) {
        childCoordinators.removeAll { tmp in
            tmp === coordinator
        }
        start()
    }
}

extension AppCoordinator: OnBoardingRootCoordinatorProtocol {
    func finishedOnBoarding(_ coordinator: Coordinator) {
        childCoordinators.removeAll { tmp in
            tmp === coordinator
        }
        start()
    }
}

extension AppCoordinator: TabBarRootCoordinatorProtocol {
    func finished(_ coordinator: Coordinator) {
        childCoordinators.removeAll { tmp in
            tmp === coordinator
        }
        start()
    }
}
