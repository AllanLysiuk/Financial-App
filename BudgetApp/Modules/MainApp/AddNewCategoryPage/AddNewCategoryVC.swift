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
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var amountTextField: UITextField!
    @IBOutlet private weak var buttonSave: UIButton!
    @IBOutlet private weak var newCategoryLabel: UILabel!
    @IBOutlet private weak var iconLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var amountLabel: UILabel!
    @IBOutlet private weak var currencyLabel: UILabel!
    @IBOutlet private weak var currencyCodeLabel: UILabel!
    @IBOutlet private weak var switchLabel: UILabel!
    @IBOutlet private weak var switchElem: UISwitch!
    
    
    private var viewModel: AddNewCategoryVMProtocol
    private var isWalletAdding: Bool
    
    init(viewModel: AddNewCategoryVMProtocol, isWalletAdding: Bool) {
        self.viewModel = viewModel
        self.isWalletAdding = isWalletAdding
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if !isWalletAdding {
            amountLabel.isHidden = true
            amountTextField.isHidden = true
            currencyLabel.isHidden = true
            currencyCodeLabel.isHidden = true
            switchLabel.isHidden = true
            switchElem.isHidden = true
        }
        nameTextField.delegate = self
        amountTextField.delegate = self
        setUpUI()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if parent == nil {
            viewModel.finish(shouldMoveToParent: false)
        }
    }
    
    #warning("remove force unwrap")
    @IBAction func buttonSaveDidTap() {
        let amount = amountTextField.text!
        if let sum = Double(amount) {
            viewModel.buttonSaveDidTap(name: nameTextField.text ?? "", image: imageView.image!, sum: sum, considerInBalanceFlag: switchElem.isOn)
        } else {
            viewModel.buttonSaveDidTap(name: nameTextField.text ?? "", image: imageView.image!, sum: 0, considerInBalanceFlag: switchElem.isOn)
        }
    }
    
    @IBAction func buttonCloseDidTap() {
        viewModel.buttonCloseDidTap()
    }
    
    @IBAction func switchStateDidChange(_ sender: UISwitch) {
        if sender.isOn {
            print("isOn")
        } else {
            print("isOff")
        }
    }
}

extension AddNewCategoryVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


extension AddNewCategoryVC {
    #warning("set normal image not system")
    private func setUpUI () {
        imageView.image = UIImage(systemName: "creditcard")
        imageView.layer.cornerRadius = 20
        
        buttonSave.backgroundColor = UIColor(red: 0.204, green: 0.412, blue: 0.945, alpha: 1)
        buttonSave.layer.cornerRadius = 24
        buttonSave.titleLabel?.text = "Save"
        buttonSave.titleLabel?.font = UIFont(name: "Montserrat-SemiBold", size: 18)
        buttonSave.titleLabel?.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        
        newCategoryLabel.font = UIFont(name: "Montserrat-SemiBold", size: 16)
        newCategoryLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        
        iconLabel.font = UIFont(name: "Montserrat-SemiBold", size: 14)
        iconLabel.textColor = UIColor(red: 0.118, green: 0.11, blue: 0.11, alpha: 0.5)
        
        nameLabel.font = UIFont(name: "Montserrat-SemiBold", size: 14)
        nameLabel.textColor = UIColor(red: 0.118, green: 0.11, blue: 0.11, alpha: 0.5)
        
        amountLabel.font = UIFont(name: "Montserrat-SemiBold", size: 14)
        amountLabel.textColor = UIColor(red: 0.118, green: 0.11, blue: 0.11, alpha: 0.5)
        
        currencyLabel.font = UIFont(name: "Montserrat-SemiBold", size: 16)
        currencyLabel.textColor = UIColor(red: 0.118, green: 0.11, blue: 0.11, alpha: 1)
        
        currencyCodeLabel.font = UIFont(name: "Montserrat-SemiBold", size: 20)
        currencyCodeLabel.textColor = UIColor(red: 0.118, green: 0.11, blue: 0.11, alpha: 1)
        
        switchLabel.font = UIFont(name: "Montserrat-SemiBold", size: 16)
        switchLabel.textColor = UIColor(red: 0.118, green: 0.11, blue: 0.11, alpha: 1)
        
        switchElem.onTintColor = UIColor(red: 0.204, green: 0.412, blue: 0.945, alpha: 1)
    }
}
