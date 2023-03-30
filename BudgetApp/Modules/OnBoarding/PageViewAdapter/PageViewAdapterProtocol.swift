//
//  PageViewAdapterProtocol.swift
//  BudgetApp
//
//  Created by Allan on 19.03.23.
//

import Foundation
import UIKit

protocol PageViewAdapterProtocol {
    func setupPageView(_ pageView: UIPageViewController, _ pages: [OnBoardingPage])
    func setupActionDelegate(_ delegate: AdapterActionDelegate)
    func skipTapped()
    func nextTapped()
    func pageControllerTapped(_ currentPage: Int)
}
