//
//  LoginVC.swift
//  BudgetApp
//
//  Created by Allan on 28.02.23.
//

import Foundation
import UIKit

final class LoginVC: UIViewController{
    
    @IBOutlet private weak var loginTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    private var viewModel: LoginViewModelProtocol
    
    init (viewModel: LoginViewModelProtocol){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func buttonLoginDidTap(){
        print("Login did tap in LoginVC")
        viewModel.login()
        
    }
    @IBAction private func buttonRegisterDidTap(){
        print("Register did tap in LoginVC")
        viewModel.openRegisterScene()
        
    }
    @IBAction private func buttonForgotPasswordDidTap(){
        print("Forgot password did tap in LoginVC")
        viewModel.openForgotPasswordScene()
       
    }
}
