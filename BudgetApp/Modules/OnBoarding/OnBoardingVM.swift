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
        PageViewController(image: UIImage(named: "OnBoardingImage")!, title: "First Screen", subtitle: "Start your career in iOS development"),
        PageViewController(image: UIImage(named: "OnBoardingImage")!, title: "Second Screen", subtitle: "Start your career in iOS development Start your career in iOS development Start your career in iOS development"),
        PageViewController(image: UIImage(named: "OnBoardingImage")!, title: "Third Screen", subtitle: "Start your career in iOS development Start your career in iOS development Start your career in iOS development Start your career in iOS development")]
    
    var pageControl = UIPageControl()
    private var adapter: PageViewAdapterProtocol
    
    private weak var coordinator: OnBoardingCoordinatorProtocol?
    
    init(coordinator: OnBoardingCoordinatorProtocol, adapter: PageViewAdapterProtocol){
        self.coordinator = coordinator
        self.adapter = adapter
    }
    
    func setUp(with pageView: UIPageViewController, with pageControl: UIPageControl) {
        adapter.setupPageView(pageView, pageControl, pages)
    }
    
    
}
