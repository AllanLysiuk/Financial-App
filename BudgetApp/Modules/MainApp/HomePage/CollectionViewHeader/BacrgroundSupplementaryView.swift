//
//  BacrgroundSupplementaryView.swift
//  BudgetApp
//
//  Created by Allan on 3.04.23.
//

import Foundation
import UIKit

final class BackgroundSupplementaryView: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 8
        backgroundColor = UIColor(white: 1, alpha: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
