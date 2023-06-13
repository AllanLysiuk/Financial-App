//
//  MovementOfAccountVC.swift
//  BudgetApp
//
//  Created by Allan on 13.06.23.
//

import Foundation
import UIKit

final class MovementOfAccountVC: UIViewController {
    @IBOutlet private weak var screenLabel: UILabel!
    @IBOutlet private weak var sumNameLabel: UILabel!
    @IBOutlet private weak var sumLabel: UILabel!
    @IBOutlet private weak var leftCategoryLabel: UILabel!
    @IBOutlet private weak var leftCategoryNameLabel: UILabel!
    @IBOutlet private weak var rightCategoryLabel: UILabel!
    @IBOutlet private weak var rightCategoryNameLabel: UILabel!
    @IBOutlet private weak var leftImageView: UIImageView!
    @IBOutlet private weak var rightImageView: UIImageView!
    @IBOutlet private weak var closeButton: UIButton!
    @IBOutlet private weak var saveButton: UIButton!
    
    private var viewModel: MovementOfAccountVMProtocol
    
    init(viewModel: MovementOfAccountVMProtocol){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setUpUI() {
        screenLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        screenLabel.font = UIFont(name: "Montserrat-SemiBold", size: 20)
        
        sumNameLabel.textColor = UIColor(red: 0.118, green: 0.11, blue: 0.11, alpha: 0.5)
        sumNameLabel.font = UIFont(name: "Montserrat-SemiBold", size: 14)
        
        sumLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        sumLabel.font = UIFont(name: "Montserrat-Bold", size: 32)
        
        leftCategoryLabel.textColor = UIColor(red: 0.118, green: 0.11, blue: 0.11, alpha: 0.5)
        leftCategoryLabel.font = UIFont(name: "Montserrat-SemiBold", size: 14)
        
        rightCategoryLabel.textColor = UIColor(red: 0.118, green: 0.11, blue: 0.11, alpha: 0.5)
        rightCategoryLabel.font = UIFont(name: "Montserrat-SemiBold", size: 14)
        
        leftCategoryNameLabel.textColor = UIColor(red: 0.118, green: 0.11, blue: 0.11, alpha: 1)
        leftCategoryNameLabel.font = UIFont(name: "Montserrat-SemiBold", size: 16)
        
        rightCategoryNameLabel.textColor = UIColor(red: 0.118, green: 0.11, blue: 0.11, alpha: 1)
        rightCategoryNameLabel.font = UIFont(name: "Montserrat-SemiBold", size: 16)
        
        leftImageView.image = viewModel.getImageAccFrom()
        leftImageView.layer.cornerRadius = 20
        
        rightImageView.image = viewModel.getImageAccTo()
        rightImageView.layer.cornerRadius = 20
        
        saveButton.backgroundColor = UIColor(red: 0.204, green: 0.412, blue: 0.945, alpha: 1)
        saveButton.layer.cornerRadius = 24
        saveButton.titleLabel?.text = "Save"
        saveButton.titleLabel?.font = UIFont(name: "Montserrat-SemiBold", size: 18)
        saveButton.titleLabel?.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if parent == nil {
            viewModel.finish(shouldMoveToParent: false)
        }
    }
    
    @IBAction func closeButtonDidTap() {
        
    }
    
    @IBAction func saveButtonDidTap() {
        
    }
}
