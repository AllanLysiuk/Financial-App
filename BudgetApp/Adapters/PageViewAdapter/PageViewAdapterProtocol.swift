//
//  PageViewAdapterProtocol.swift
//  BudgetApp
//
//  Created by Allan on 19.03.23.
//

import Foundation
import UIKit

protocol PageViewAdapterProtocol {
    func setupPageView(_ pageView: UIPageViewController, _ pageControl: UIPageControl)
    func setupPages(_ pages: [UIViewController])
}
