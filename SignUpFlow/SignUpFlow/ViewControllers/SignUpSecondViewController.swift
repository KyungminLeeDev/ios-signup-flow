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
    @IBOutlet weak var birthDatePicker: UIDatePicker!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet var keyboardToolBar: UIToolbar!
    
    // MARK: - Properites
    class var storyboardID: String {
        return "\(self)"
    }
  
    private let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        // 날짜 형식 "November 18, 2020"
        formatter.dateStyle = .long
        
        return formatter
    }()
    
    private var isValidBirthDate: Bool {
        guard let birthDateString = birthDateLabel.text else {
            return false
        }
        
        guard birthDateString != dateFormatter.string(from: Date()) else {
            print("생년월일을 설정하지 않았음")
            return false
        }
        
        return true
    }
  
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        phoneNumberTextField.delegate = self
        setupDatePicker()
        loadUserInformation()
        updateDateLabelFromDatePicker(birthDatePicker)
        checkToEnableSignUpButton()
    }
}

// MARK: - IBActions & Methods
extension SignUpSecondViewController {    
    @IBAction func touchUpDoneButton(_ sender: UIBarButtonItem) {
        guard checkPhoneNumberPatternMatching() else {
            alertInvalidPhoneNumber()
            return
        }
        
        checkToEnableSignUpButton()
        
        phoneNumberTextField.resignFirstResponder()
    }
    
    @IBAction func touchUpCancelButton(_ sender: UIButton) {
        clearUserInformation()
        
        dismiss(animated: true, completion: nil)
    }

    @IBAction func touchUpPreviousButton(_ sender: UIButton) {
        saveUserInformation()
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func touchUpSignUpButton(_ sender: UIButton) {
        dismiss(animated: true) {
            self.saveUserInformation()
        }
    }
    
    private func saveUserInformation() {
        let card = UserInformation.card
        
        card.phoneNumber = phoneNumberTextField.text
        card.birthDate = birthDatePicker.date
    }
    
    private func loadUserInformation() {
        let card = UserInformation.card
        
        phoneNumberTextField.text = card.phoneNumber
        if let birthDate = card.birthDate {
            birthDatePicker.date = birthDate
        }
    }
    
    private func clearUserInformation() {
        UserInformation.card.clear()
    }
    
    private func checkToEnableSignUpButton() {
        if phoneNumberTextField.text == "" || isValidBirthDate == false {
            signUpButton.isEnabled = false
        } else {
            signUpButton.isEnabled = true
        }
    }
    
    private func alertInvalidPhoneNumber() {
        let alert = UIAlertController(title: "알림", message: "핸드폰 번호 양식과 일치하지 않습니다 😭", preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    
    private func checkPhoneNumberPatternMatching() -> Bool {
        guard let phoneNumber = phoneNumberTextField.text else {
            return false
        }
        let range = NSRange(location: 0, length: phoneNumber.count)
        guard let patternForValidPhoneNumber = try? NSRegularExpression(pattern: "^01([0|1|6|7|8|9])[-|.]?([0-9]{3,4})[-|.]?([0-9]{4})$") else {
            return false
        }
        
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
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        signUpButton.isEnabled = false
    }
}

// MARK: - UIDatePicker Methods
extension SignUpSecondViewController {
    func setupDatePicker() {
        birthDatePicker.addTarget(self, action: #selector(didDatePickerValueChanged(_:)), for: UIControl.Event.valueChanged)
        birthDatePicker.maximumDate = Date()
        
        if #available(iOS 14.0, *) {
            birthDatePicker.preferredDatePickerStyle = .inline
        } else if #available(iOS 13.4, *) {
            birthDatePicker.preferredDatePickerStyle = .wheels
        }
    }
    
    @objc func didDatePickerValueChanged(_ sender: UIDatePicker) {
        updateDateLabelFromDatePicker(sender)
        checkToEnableSignUpButton()
    }
    
    func updateDateLabelFromDatePicker(_ sender: UIDatePicker) {
        let dateString: String = dateFormatter.string(from: sender.date)
        birthDateLabel.text = dateString
    }
}
