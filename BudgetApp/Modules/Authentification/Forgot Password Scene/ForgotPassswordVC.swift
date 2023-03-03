//
//  ForgotPassswordVC.swift
//  BudgetApp
//
//  Created by Allan on 3.03.23.
//

import Foundation
import UIKit

final class ForgotPasswordVC: UIViewController{
    
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var repeatPasswordTextField: UITextField!
    
    private var viewModel: ForgotPasswordViewModelProtocol
    
    init(viewModel: ForgotPasswordViewModelProtocol){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func changePasswordDidTap(){
        viewModel.changePassword()
    }
    
}
