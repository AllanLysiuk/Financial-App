//
//  UIButtonExtension.swift
//  BudgetApp
//
//  Created by Allan on 14.03.23.
//

import Foundation
import UIKit
extension UIButton{
    func prepareButtonForRightView(){
        self.frame = CGRect(x:0, y:0, width:30, height:30)
        self.setImage(UIImage(systemName: "eye"), for: .normal)
    }
    
    func secureButtonToggle(isSecure: Bool){
        if isSecure{
           self.setImage(UIImage(systemName: "eye"), for: .normal)
        }else{
          self.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        }
    }
}
