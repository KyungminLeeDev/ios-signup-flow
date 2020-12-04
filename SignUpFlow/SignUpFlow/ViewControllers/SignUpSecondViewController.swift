//
//  SignUpSecondViewController.swift
//  SignUpFlow
//
//  Created by Kyungmin Lee on 2020/12/02.
//

import UIKit

class SignUpSecondViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var birthDateLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet var keyboardToolBar: UIToolbar!
    
    // MARK: - Properites
    class var storyboardID: String {
        return "\(self)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
    }
}

//MARK:- Extensions

//MARK: IBActions & Methods
extension SignUpSecondViewController {
    @IBAction func finishInput(_ sender: UIBarButtonItem) {
        if checkPhoneNumberPatternMatching() == true {
            phoneNumberTextField.resignFirstResponder()
        } else {
            alertInvalidPhoneNumber()
        }
    }

    private func setDelegate() {
        phoneNumberTextField.delegate = self
    }
    
    private func alertInvalidPhoneNumber() {
        let alert = UIAlertController(title: "알림", message: "핸드폰 번호 양식과 일치하지 않습니다 😭", preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    
    private func checkPhoneNumberPatternMatching() -> Bool {
        guard let phoneNumber = phoneNumberTextField.text else { return false }
        let range = NSRange(location: 0, length: phoneNumber.count)
        guard let patternForValidPhoneNumber = try? NSRegularExpression(pattern: "^01([0|1|6|7|8|9])[-|.]?([0-9]{3,4})[-|.]?([0-9]{4})$") else { return false }
        
        if patternForValidPhoneNumber.firstMatch(in: phoneNumber, range: range) != nil {
            return true
        } else {
            return false
        }
    }
}

//MARK: UITextFieldDelegate Methods
extension SignUpSecondViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.inputAccessoryView = keyboardToolBar
        return true
    }
}
