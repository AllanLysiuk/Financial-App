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
    private var email: String
    
    init(viewModel: ForgotPasswordViewModelProtocol, email: String){
        self.viewModel = viewModel
        self.email = email
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.text = email
    }
    override func willMove(toParent parent: UIViewController?) {
            super.willMove(toParent: parent)
            if parent == nil
            {
                viewModel.finish(shouldMoveToParent: false)
            }
    }
    @IBAction private func changePasswordDidTap(){
        viewModel.changePassword(email: emailTextField.text)
    }
    
}
