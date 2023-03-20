//
//  OnBoardingVM.swift
//  BudgetApp
//
//  Created by Allan on 18.03.23.
//

import Foundation
import UIKit

final class OnBoardingVM: OnBoardingViewModelProtocol{

    var pages: [UIViewController] = []
    var pageControl = UIPageControl()
    private var adapter: PageViewAdapterProtocol
    
    private weak var coordinator: OnBoardingCoordinatorProtocol?
    
    init(coordinator: OnBoardingCoordinatorProtocol, adapter: PageViewAdapterProtocol){
        self.coordinator = coordinator
        self.adapter = adapter
    }
    
    func setUp(with pageView: UIPageViewController, with pageControl: UIPageControl) {
        adapter.setupPageView(pageView, pageControl)
    }
    
    
}
