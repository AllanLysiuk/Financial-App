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
        imageView.layer.cornerRadius = 50
    }
    #warning("remove force unwrap")
    @IBAction func buttonSaveDidTap() {
        viewModel.buttonSaveDidTap(name: textField.text ?? "", image: imageView.image!)
    }
}

extension AddNewCategoryVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
