//
//  RegisterVC.swift
//  BudgetApp
//
//  Created by Allan on 28.02.23.
//

import Foundation
import UIKit

final class RegisterVC: UIViewController{
    
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var checkPasswordTextField: UITextField!
    
    
    private var viewModel: RegisterViewModelProtocol
    
    init (viewModel: RegisterViewModelProtocol){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.text = viewModel.email
        createRightViewButton(textField: passwordTextField, selector: #selector(secureInputButonDidTap), tag: 0)
        createRightViewButton(textField: checkPasswordTextField, selector: #selector(secureInputButonDidTap), tag: 1)
        
    }
    
    override func willMove(toParent parent: UIViewController?) {
            super.willMove(toParent: parent)
            if parent == nil
            {
                viewModel.finish(shouldMoveToParent: false)
            }
    }
    
    @objc func secureInputButonDidTap(sender: UIButton!) {
        if sender.tag == 0{
            passwordTextField.togglePasswordVisibility()
            sender.secureButtonToggle(isSecure: passwordTextField.isSecureTextEntry)
        }else{
            checkPasswordTextField.togglePasswordVisibility()
            sender.secureButtonToggle(isSecure: checkPasswordTextField.isSecureTextEntry)
        }
        
    }
    
    @IBAction private func register(){
        viewModel.register(email: emailTextField.text, password: passwordTextField.text)
    }
                              
    private func createRightViewButton(textField: UITextField, selector: Selector, tag: Int) {
        let rightButton  = UIButton(type: .custom)
        rightButton.tag = tag
        rightButton.prepareButtonForRightView()
        rightButton.addTarget(self, action: selector, for: .touchUpInside)
        textField.rightViewMode = .always
        textField.rightView = rightButton
    }
    
}
