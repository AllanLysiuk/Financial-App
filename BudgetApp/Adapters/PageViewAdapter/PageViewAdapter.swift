//
//  PageViewAdapter.swift
//  BudgetApp
//
//  Created by Allan on 19.03.23.
//

import Foundation
import UIKit

final class PageViewAdapter: NSObject, PageViewAdapterProtocol {

    private weak var pageView: UIPageViewController?
    private weak var pageControl: UIPageControl?
    
    private var pages: [UIViewController] = []
    private var initialPage: Int = 0
    
    func setupPageView(_ pageView: UIPageViewController, _ pageControl: UIPageControl, _ pages: [UIViewController]) {
        self.pageView = pageView
        self.pageControl = pageControl
        self.pages = pages
        setupPageView()
    }
    
    func setupPages(_ pages: [UIViewController]) {
        self.pages = pages
        setupPageView()
    }
    
    private func setupPageView() {
        pageView?.dataSource = self
        pageView?.delegate = self
        
        setUp()
        style()
        layout()
    }
    
    private func setUp() {
        pageControl?.addTarget(self, action: #selector(pageControllerTapped(_:)), for: .valueChanged)
        pageView?.setViewControllers([pages[initialPage]], direction: .forward, animated: true, completion: nil)
     }
     
    func style() {
        pageControl?.translatesAutoresizingMaskIntoConstraints = false
        pageControl?.currentPageIndicatorTintColor = .black
        pageControl?.pageIndicatorTintColor = .systemGray2
        pageControl?.numberOfPages = pages.count
        pageControl?.currentPage = initialPage
    }
     
     private func layout() {
         pageView?.view.addSubview(pageControl ?? UIPageControl())
         guard let pageControl = pageControl, let pageView = pageView else {
             return
         }
         
         NSLayoutConstraint.activate([
            pageControl.widthAnchor.constraint(equalTo: pageView.view.widthAnchor ),
            pageControl.heightAnchor.constraint(equalToConstant: 20.0),
            pageControl.bottomAnchor.constraint(equalTo: pageView.view.bottomAnchor, constant: -20.0)
         ])
     }
     
     @objc func pageControllerTapped(_ sender: UIPageControl) {
         pageView?.setViewControllers([pages[sender.currentPage]], direction: .forward, animated: true, completion: nil)
     }
    
}

extension PageViewAdapter: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        guard let viewControllers = pageViewController.viewControllers else { return }
        guard let currentIndex = pages.firstIndex(of: viewControllers[0]) else { return }
        
        pageControl?.currentPage = currentIndex
    }

}

extension PageViewAdapter: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil}
        if currentIndex == 0 {
            return pages.last
        } else{
            return pages[currentIndex - 1]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil}
        if currentIndex < pages.count - 1 {
            return pages[currentIndex + 1]
        } else{
            return pages.first
        }
    }
    
    
}
