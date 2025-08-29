//
//  LoginVC.swift
//  Love Bite
//
//  Created by iMac on 25/08/25.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var viewEmail: UIView!
    @IBOutlet weak var viewPassword: UIView!
    @IBOutlet weak var viewLoginBtn: UIView!
    
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    
    
    @IBOutlet weak var imgHidePass: UIImageView!
    
    @IBOutlet weak var lblLogin: UILabel!
    
    var isPasswordHidden = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        txtEmail.delegate = self
        txtPassword.delegate = self
        
        // Add target for text change
        txtEmail.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
        txtPassword.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
        
        setDefaultBorders()
        updateLoginButtonState()
        // Do any additional setup after loading the view.
    }

    @IBAction func clickedHidePassword(_ sender: Any) {
        isPasswordHidden.toggle()
        txtPassword.isSecureTextEntry = isPasswordHidden
        
        let imageName = isPasswordHidden ? "ic_closeEye" : "ic_OpenEye"
        imgHidePass.image = UIImage(named: imageName)
    }
    
    @IBAction func clickedFogotPass(_ sender: Any) {
        let vc = ForgotPasswordVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func clickedLogin(_ sender: Any) {
        
    }
    
    @IBAction func clickedCreateAccount(_ sender: Any) {
        let vc = RegisterVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    private func setDefaultBorders() {
        viewEmail.layer.borderWidth = 1
        viewEmail.layer.cornerRadius = 10
        viewEmail.layer.borderColor = UIColor.clear.cgColor
        
        viewPassword.layer.borderWidth = 1
        viewPassword.layer.cornerRadius = 10
        viewPassword.layer.borderColor = UIColor.clear.cgColor
    }
    
    @objc private func textFieldsDidChange() {
        updateLoginButtonState()
    }
    
    private func updateLoginButtonState() {
        let isEmailFilled = !(txtEmail.text ?? "").isEmpty
        let isPasswordFilled = !(txtPassword.text ?? "").isEmpty
        
        if isEmailFilled && isPasswordFilled {
            viewLoginBtn.backgroundColor = UIColor.AppColor.appPrimeryColor
            lblLogin.textColor = .white
        } else {
            viewLoginBtn.backgroundColor = UIColor(hexString: "#F9F9F9")
            lblLogin.textColor = .AppColor.appTextGrayColor
        }
    }
    
}

extension LoginVC: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == txtEmail {
            viewEmail.layer.borderColor = UIColor.AppColor.appPrimeryColor.cgColor
        } else if textField == txtPassword {
            viewPassword.layer.borderColor = UIColor.AppColor.appPrimeryColor.cgColor
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == txtEmail {
            viewEmail.layer.borderColor = UIColor.clear.cgColor
        } else if textField == txtPassword {
            viewPassword.layer.borderColor = UIColor.clear.cgColor
        }
    }
}
