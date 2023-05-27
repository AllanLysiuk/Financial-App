//
//  AddNewCategoryVC.swift
//  BudgetApp
//
//  Created by Allan on 13.04.23.
//

import Foundation
import UIKit

final class AddNewCategoryVC: UIViewController {
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var buttonSave: UIButton!
    @IBOutlet private weak var newCategoryLabel: UILabel!
    @IBOutlet private weak var iconLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    
    
    private var viewModel: AddNewCategoryVMProtocol
    
    init(viewModel: AddNewCategoryVMProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        setUpUI()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if parent == nil {
            viewModel.finish(shouldMoveToParent: false)
        }
    }
    
    #warning("set normal image not system")
    private func setUpUI () {
        newCategoryLabel.font = UIFont(name: "Montserrat-SemiBold", size: 16)
        newCategoryLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        
        iconLabel.font = UIFont(name: "Montserrat-SemiBold", size: 14)
        iconLabel.textColor = UIColor(red: 0.118, green: 0.11, blue: 0.11, alpha: 0.5)
        
        nameLabel.font = UIFont(name: "Montserrat-SemiBold", size: 14)
        nameLabel.textColor = UIColor(red: 0.118, green: 0.11, blue: 0.11, alpha: 0.5)
        
        imageView.image = UIImage(systemName: "creditcard")
        imageView.layer.cornerRadius = 20
        
        textField.layer.cornerRadius = 12
        
        buttonSave.backgroundColor = UIColor(red: 0.204, green: 0.412, blue: 0.945, alpha: 1)
        buttonSave.layer.cornerRadius = 24
        buttonSave.titleLabel?.text = "Save"
        buttonSave.titleLabel?.font = UIFont(name: "Montserrat-SemiBold", size: 18)
        buttonSave.titleLabel?.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        
    }
    
    #warning("remove force unwrap")
    @IBAction func buttonSaveDidTap() {
        viewModel.buttonSaveDidTap(name: textField.text ?? "", image: imageView.image!)
    }
    
    @IBAction func buttonCloseDidTap() {
        viewModel.buttonCloseDidTap()
    }
}

extension AddNewCategoryVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
