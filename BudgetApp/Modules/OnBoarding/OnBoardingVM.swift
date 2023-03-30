//
//  OnBoardingVM.swift
//  BudgetApp
//
//  Created by Allan on 18.03.23.
//

import Foundation
import UIKit

final class OnBoardingVM: OnBoardingViewModelProtocol {

    var pages: [OnBoardingPage] = [.first, .second, .third]
    
    
    private var adapter: PageViewAdapterProtocol
    private var pageControl: UIPageControl?
    private weak var coordinator: OnBoardingCoordinatorProtocol?
    
    init(coordinator: OnBoardingCoordinatorProtocol, adapter: PageViewAdapterProtocol) {
        self.coordinator = coordinator
        self.adapter = adapter
        self.adapter.setupActionDelegate(self)
    }
    
    func setUp(with pageView: UIPageViewController, with pageControl: UIPageControl) {
        adapter.setupPageView(pageView, pages)
    }
    
    func getPagesNumber() -> Int {
        return pages.count
    }
    
    func skipButtonTapped() {
        adapter.skipTapped()
    }
    
    func nextButtonTapped() {
        adapter.nextTapped()
    }
    
    func setPageControl(_ pageControl: UIPageControl) {
        self.pageControl = pageControl
        pageControl.addTarget(self, action: #selector(pageControllerTapped(_:)), for: .valueChanged)
    }
    
    
    @objc func pageControllerTapped(_ sender: UIPageControl) {
        adapter.pageControllerTapped(pageControl?.currentPage ?? 0)
    }
}


extension OnBoardingVM: AdapterActionDelegate {
    func pageControlGetCurrentPage() -> Int {
        return pageControl?.currentPage ?? 0
    }
    
    func pageControlSetCurrentPage(_ currentPage: Int) {
        pageControl?.currentPage = currentPage
    }
    
    func finishOnBoarding() {
        let ud = UserDefaults()
        ud.set(true, forKey: "shouldShowOnboarding")
        coordinator?.finish()
    }
}
