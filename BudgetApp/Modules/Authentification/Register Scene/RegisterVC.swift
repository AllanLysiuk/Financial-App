//
//  RegisterVC.swift
//  BudgetApp
//
//  Created by Allan on 28.02.23.
//

import Foundation
import UIKit

final class RegisterVC: UIViewController{
    
    @IBOutlet private weak var usernameTextField: UITextField!
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
    }
    
    @IBAction private func register(){
        viewModel.register()
    }
    
}
