//
//  TabBarController.swift
//  BudgetApp
//
//  Created by Allan on 24.03.23.
//

import Foundation
import UIKit

final class TabBarController: UITabBarController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    private func setupTabBar(){
       
        setTabBarAppearance()
       // let images = ["circle.grid.3x3","books.vertical","list.clipboard", "gearshape"]
    }
    
    private func setTabBarAppearance(){
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        
        setTabBarItemColors(appearance.stackedLayoutAppearance)
        self.tabBar.standardAppearance = appearance
        self.tabBar.scrollEdgeAppearance = tabBar.standardAppearance
    }
    
    private func setTabBarItemColors(_ itemAppearance: UITabBarItemAppearance) {
        itemAppearance.normal.iconColor = .lightGray
        itemAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
         
        itemAppearance.selected.iconColor = .systemBlue
        itemAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemBlue]
    }
}
