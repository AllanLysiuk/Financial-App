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
        #warning("TabBar shadow problem")
        self.tabBar.layer.shadowColor = UIColor(red: 0.118, green: 0.11, blue: 0.11, alpha: 0.15).cgColor
        self.tabBar.layer.shadowOpacity = 1
        self.tabBar.layer.shadowRadius = 11
        self.tabBar.layer.shadowOffset = CGSize(width: 0, height: -2)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        self.tabBar.layer.masksToBounds = true
        self.tabBar.layer.cornerRadius = 23
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner] // only the top right and left corners
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
