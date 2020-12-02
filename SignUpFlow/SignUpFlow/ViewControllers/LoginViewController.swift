//
//  SignUpFlow - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGestureRecognizer()
    }
    
    @IBAction func tappedView(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    func setupGestureRecognizer() {
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tappedView(_:)))
        
        view.addGestureRecognizer(tapGesture)
    }
}

