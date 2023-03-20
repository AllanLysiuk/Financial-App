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
        
    }
    
  
    
}



