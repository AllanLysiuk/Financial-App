//
//  OnBoardingVC.swift
//  BudgetApp
//
//  Created by Allan on 18.03.23.
//

import Foundation
import UIKit

final class OnBoardingVC: UIPageViewController {
    
    private var viewModel: OnBoardingViewModelProtocol
    private var pageControl = UIPageControl()
    
    init(viewModel: OnBoardingViewModelProtocol) {
        self.viewModel = viewModel
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: [.interPageSpacing: 0])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.setUp(with: self, with: pageControl)
        viewModel.setPageControl(pageControl)
        style()
        layout()
        styleButtons()
    }
    
    private func style() {
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .systemGray2
        pageControl.numberOfPages = viewModel.getPagesNumber()
        pageControl.currentPage = 0
    }
    
    private func layout() {
        self.view.addSubview(pageControl)
        NSLayoutConstraint.activate([
           pageControl.widthAnchor.constraint(equalTo: self.view.widthAnchor ),
           pageControl.heightAnchor.constraint(equalToConstant: 20.0),
           pageControl.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20.0)
        ])
    }
    
    private func styleButtons() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Skip", style: .plain, target: self, action: #selector(skipTapped(_:)))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(nextTapped(_:)))
    }
    
    @objc func skipTapped(_ sender: UIButton) {
       viewModel.skipButtonTapped()
    }

    @objc func nextTapped(_ sender: UIButton) {
       viewModel.nextButtonTapped()
    }
    
}



