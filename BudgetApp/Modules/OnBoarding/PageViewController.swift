//
//  PageViewController.swift
//  BudgetApp
//
//  Created by Allan on 20.03.23.
//

import Foundation
import UIKit

final class PageViewController: UIViewController{
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    
    private var image: UIImage
    private var titleText: String
    private var subtitle: String
    
    init (image: UIImage, title: String, subtitle: String){
        self.image = image
        self.titleText = title
        self.subtitle = subtitle
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
            super.viewDidLoad()
        imageView.image = image
        titleLabel.text = titleText
        subtitleLabel.text = subtitle
    }
}
