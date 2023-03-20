//
//  LoginVC.swift
//  BudgetApp
//
//  Created by Allan on 28.02.23.
//

import Foundation
import UIKit

final class LoginVC: UIViewController{
    
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    private var viewModel: LoginViewModelProtocol
    
    init (viewModel: LoginViewModelProtocol){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.setupViewDelegate(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createRightViewButton(textField: passwordTextField, selector: #selector(secureInputButonDidTap))
    }
    
    @objc func secureInputButonDidTap(sender: UIButton!) {
        passwordTextField.togglePasswordVisibility()
        sender.secureButtonToggle(isSecure: passwordTextField.isSecureTextEntry)
    }
    
    @IBAction private func buttonLoginDidTap(){
        viewModel.login(email: emailTextField.text, password: passwordTextField.text)
    }
    @IBAction private func buttonRegisterDidTap(){
        print("Register did tap in LoginVC")
        viewModel.openRegisterScene(with: emailTextField.text)
        
    }
    @IBAction private func buttonForgotPasswordDidTap(){
        print("Forgot password did tap in LoginVC")
        viewModel.openForgotPasswordScene(with: emailTextField.text)
       
    }
    
    private func createRightViewButton(textField: UITextField, selector: Selector){
        let rightButton  = UIButton(type: .custom)
        rightButton.prepareButtonForRightView()
        rightButton.addTarget(self, action: selector, for: .touchUpInside)
        textField.rightViewMode = .always
        textField.rightView = rightButton
    }
    
}

extension LoginVC: LoginVCDelegate{
    func getEmail(_ email: String) {
        emailTextField.text = email
    }
}



