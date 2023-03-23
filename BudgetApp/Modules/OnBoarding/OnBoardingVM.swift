//
//  OnBoardingVM.swift
//  BudgetApp
//
//  Created by Allan on 18.03.23.
//

import Foundation
import UIKit

final class OnBoardingVM: OnBoardingViewModelProtocol{

    var pages: [UIViewController] = [
        OnBoardingPageList(image: UIImage(named: "OnBoardingImage")!, title: "First Screen", subtitle: "Start your career in iOS development"),
        OnBoardingPageList(image: UIImage(named: "OnBoardingImage")!, title: "Second Screen", subtitle: "Start your career in iOS development Start your career in iOS development Start your career in iOS development"),
        OnBoardingPageList(image: UIImage(named: "OnBoardingImage")!, title: "Third Screen", subtitle: "Start your career in iOS development Start your career in iOS development Start your career in iOS development Start your career in iOS development")]
    
    var pageControl = UIPageControl()
    private var adapter: PageViewAdapterProtocol
    
    private weak var coordinator: OnBoardingCoordinatorProtocol?
    
    init(coordinator: OnBoardingCoordinatorProtocol, adapter: PageViewAdapterProtocol){
        self.coordinator = coordinator
        self.adapter = adapter
        self.adapter.setupActionDelegate(self)
    }
    
    func setUp(with pageView: UIPageViewController, with pageControl: UIPageControl) {
        adapter.setupPageView(pageView, pageControl, pages)
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
}


extension OnBoardingVM: AdapterActionDelegate {
    func finishOnBoarding() {
        let ud = UserDefaults()
        ud.set(true, forKey: "shouldShowOnboarding")
        coordinator?.finish()
    }
}
