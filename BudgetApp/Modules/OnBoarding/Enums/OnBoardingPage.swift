//
//  OnBoardingPage.swift
//  BudgetApp
//
//  Created by Allan on 29.03.23.
//

import Foundation
import UIKit

enum OnBoardingPage {
    case first
    case second
    case third
    
    func getViewController() -> UIViewController {
        switch self {
        case .first:
            return OnBoardingPageList(image: UIImage(named: "OnBoardingImage")!, title: "First Screen", subtitle: "Start your career in iOS development")
        case .second:
            return  OnBoardingPageList(image: UIImage(named: "OnBoardingImage")!, title: "Second Screen", subtitle: "Start your career in iOS development Start your career in iOS development Start your career in iOS development")
        case .third:
            return OnBoardingPageList(image: UIImage(named: "OnBoardingImage")!, title: "Third Screen", subtitle: "Start your career in iOS development Start your career in iOS development Start your career in iOS development Start your career in iOS development")
        }
    }
    
}
