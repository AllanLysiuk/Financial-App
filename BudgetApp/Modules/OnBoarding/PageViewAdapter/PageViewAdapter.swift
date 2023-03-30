//
//  PageViewAdapter.swift
//  BudgetApp
//
//  Created by Allan on 19.03.23.
//

import Foundation
import UIKit

protocol AdapterActionDelegate: AnyObject {
    func finishOnBoarding()
    func pageControlGetCurrentPage() -> Int
    func pageControlSetCurrentPage(_ currentPage: Int)
}

final class PageViewAdapter: NSObject, PageViewAdapterProtocol {

    private weak var pageView: UIPageViewController?
    private weak var delegate: AdapterActionDelegate?
    
    private var pages: [UIViewController] = []
    private var initialPage: Int = 0
    
   
    //MARK: PageViewAdapterProtocol Functions
    func setupPageView(_ pageView: UIPageViewController, _ pages: [OnBoardingPage]) {
        self.pageView = pageView
        self.pages =  pages.map { elem in
            return elem.getViewController()
        }
        setupPageView()
    }
    
    func skipTapped() {
        let lastPage = pages.count - 1
        delegate?.pageControlSetCurrentPage(lastPage)
        goToSpecificPage(index: lastPage, ofViewControllers: pages)
    }
    
    func nextTapped() {
        if delegate?.pageControlGetCurrentPage() == pages.count - 1{
            delegate?.finishOnBoarding()
        }else{
            if let currentPage = delegate?.pageControlGetCurrentPage() {
            delegate?.pageControlSetCurrentPage(currentPage + 1)
            goToNextPage()
            }
        }
    }
    
    func setupActionDelegate(_ delegate: AdapterActionDelegate) {
        self.delegate = delegate
    }
    
    func pageControllerTapped(_ currentPage: Int) {
        pageView?.setViewControllers([pages[currentPage]], direction: .forward, animated: true, completion: nil)
   }
    
    //MARK: Private functions
    private func setupPageView() {
        pageView?.dataSource = self
        pageView?.delegate = self
        
        setUp()
    }
    
    private func setUp() {
        pageView?.setViewControllers([pages[initialPage]], direction: .forward, animated: true, completion: nil)
     }
    
}

//MARK: Delegate extension
extension PageViewAdapter: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard let viewControllers = pageViewController.viewControllers else { return }
        guard let currentIndex = pages.firstIndex(of: viewControllers[0]) else { return }
        delegate?.pageControlSetCurrentPage(currentIndex)
    }
}

//MARK: Data Source extension
extension PageViewAdapter: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        if currentIndex == 0 {
            return pages.last
        } else{
            return pages[currentIndex - 1]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        if currentIndex < pages.count - 1 {
            return pages[currentIndex + 1]
        } else{
            return pages.first
        }
    }
}

//MARK: Navigation between pages
extension PageViewAdapter {
    func goToNextPage(animated: Bool = true, completion: ((Bool) -> Void)? = nil) {
        guard let pageView = pageView else { return }
        
        guard let currentPage = pageView.viewControllers?[0] else { return }
        guard let nextPage = pageView.dataSource?.pageViewController(pageView, viewControllerAfter: currentPage) else { return }
        
        pageView.setViewControllers([nextPage], direction: .forward, animated: animated, completion: completion)
    }
    
    func goToSpecificPage(index: Int, ofViewControllers pages: [UIViewController]) {
        guard let pageView = pageView else { return }
        pageView.setViewControllers([pages[index]], direction: .forward, animated: true, completion: nil)
    }
}
