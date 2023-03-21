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
        emailTextField.delegate = self
        emailTextField.text = viewModel.email
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

extension ForgotPasswordVC: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTextField.resignFirstResponder()
        return true
    }
}
