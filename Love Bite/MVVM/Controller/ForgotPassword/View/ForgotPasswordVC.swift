//
//  ForgotPasswordVC.swift
//  Love Bite
//
//  Created by iMac on 25/08/25.
//

import UIKit

class ForgotPasswordVC: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var viewContinueBtn: UIView!
    @IBOutlet weak var viewEmail: UIView!
    
    @IBOutlet weak var lblContinue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        txtEmail.delegate = self
        txtEmail.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
        setDefaultBorders()
        updateContinueButtonState()
        // Do any additional setup after loading the view.
    }

    @IBAction func clickedBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func setDefaultBorders() {
        viewEmail.layer.borderWidth = 1
        viewEmail.layer.cornerRadius = 10
        viewEmail.layer.borderColor = UIColor.clear.cgColor
    }
    
    // MARK: - Text Change
    @objc private func textFieldDidChange() {
        updateContinueButtonState()
    }
    
    // MARK: - Enable/Disable Continue Button
    private func updateContinueButtonState() {
        let isEmailFilled = !(txtEmail.text ?? "").isEmpty
        
        if isEmailFilled {
            viewContinueBtn.backgroundColor = UIColor.AppColor.appPrimeryColor
            lblContinue.textColor = .white
            viewContinueBtn.isUserInteractionEnabled = true
        } else {
            viewContinueBtn.backgroundColor = UIColor.clear
            lblContinue.textColor = .darkGray
            viewContinueBtn.isUserInteractionEnabled = false
        }
    }
    
}

extension ForgotPasswordVC: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == txtEmail {
            viewEmail.layer.borderColor = UIColor.AppColor.appPrimeryColor.cgColor
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == txtEmail {
            viewEmail.layer.borderColor = UIColor.clear.cgColor
        }
    }
}
