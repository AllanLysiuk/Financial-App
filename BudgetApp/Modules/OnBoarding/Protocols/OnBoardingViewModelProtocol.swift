//
//  OnBoardingViewModelProtocol.swift
//  BudgetApp
//
//  Created by Allan on 18.03.23.
//

import Foundation
import UIKit
protocol OnBoardingViewModelProtocol: AnyObject {
    func setUp(with pageView: UIPageViewController, with pageControl: UIPageControl)
    func getPagesNumber() -> Int
    func skipButtonTapped()
    func nextButtonTapped()
    func setPageControl(_ pageControl: UIPageControl)
}
