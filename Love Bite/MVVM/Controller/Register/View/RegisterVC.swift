//
//  RegisterVC.swift
//  Love Bite
//
//  Created by iMac on 25/08/25.
//

import UIKit
import FirebaseAuth

class RegisterVC: UIViewController {

    @IBOutlet weak var viewUsername: UIView!
    @IBOutlet weak var viewEmail: UIView!
    @IBOutlet weak var viewPassword: UIView!
    @IBOutlet weak var viewConfirmPassword: UIView!
    @IBOutlet weak var viewReferralCode: UIView!
    @IBOutlet weak var viewContinueBtn: UIView!
    
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    @IBOutlet weak var txtReferralCode: UITextField!
    
    @IBOutlet weak var imgHidePassword: UIImageView!
    @IBOutlet weak var imgHideConfirmPass: UIImageView!
    @IBOutlet weak var imgCheckBox: UIImageView!
    
    @IBOutlet weak var lblConfirmBtn: UILabel!
    
    private var isPasswordHidden = true
    private var isConfirmPasswordHidden = true
    
    private var isChecked = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        [txtUsername, txEmail, txtPassword, txtConfirmPassword, txtReferralCode].forEach {
            $0?.delegate = self
            $0?.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
        }
        
        setDefaultBorders()
        updateContinueButtonState()
        // Do any additional setup after loading the view.
    }

    @IBAction func clickedLogin(_ sender: Any) {
        let vc = LoginVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func clickedHidePassword(_ sender: Any) {
        isPasswordHidden.toggle()
        txtPassword.isSecureTextEntry = isPasswordHidden
        let imageName = isPasswordHidden ? "ic_closeEye" : "ic_OpenEye"
        imgHidePassword.image = UIImage(named: imageName)
    }
    
    @IBAction func clickedHideConfirmPasword(_ sender: Any) {
        isConfirmPasswordHidden.toggle()
        txtConfirmPassword.isSecureTextEntry = isConfirmPasswordHidden
        let imageName = isConfirmPasswordHidden ? "ic_closeEye" : "ic_OpenEye"
        imgHideConfirmPass.image = UIImage(named: imageName)
    }
    
    @IBAction func clickedCheck(_ sender: Any) {
        isChecked.toggle()
        
        if isChecked {
            imgCheckBox.image = UIImage(named: "ic_checked")   // your checked image
        } else {
            imgCheckBox.image = UIImage(named: "ic_unchecked") // your unchecked image
        }
    }
    
    @IBAction func clickedContinue(_ sender: Any) {
        
        guard let userName = txtUsername.text, !userName.isEmpty else {
            AppDelegate.appDelegate.showAlertFromAppDelegate(title: "Error", message: "Please enter userName")
            return
        }
        
        guard let email = txEmail.text, !email.isEmpty else {
            AppDelegate.appDelegate.showAlertFromAppDelegate(title: "Error", message: "Please enter email")
            return
        }
        
        guard email.isValidEmail else {
            AppDelegate.appDelegate.showAlertFromAppDelegate(title: "Error", message: "Please enter valid email")
            return
        }
        
        guard let password = txtPassword.text, !password.isEmpty else {
            AppDelegate.appDelegate.showAlertFromAppDelegate(title: "Error", message: "Please enter password")
            return
        }
        
        guard let cofirmPassword = txtConfirmPassword.text, !cofirmPassword.isEmpty else {
            AppDelegate.appDelegate.showAlertFromAppDelegate(title: "Error", message: "Please enter confirm password")
            return
        }
        
        if password != cofirmPassword {
            AppDelegate.appDelegate.showAlertFromAppDelegate(title: "Error", message: "Password and confirm password do not match")
            return
        }
        
        registerUser(email: email, password: password, username: userName)
    }
    
    // MARK: - Register User
    func registerUser(email: String, password: String, username: String) {
        self.showActivityIndicator()
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                self.hideActivityIndicator()
                print("Error: \(error.localizedDescription)")
                AppDelegate.appDelegate.showAlertFromAppDelegate(title: "Error", message: error.localizedDescription)
            } else if let user = authResult?.user {
                // Update display name
                let changeRequest = user.createProfileChangeRequest()
                changeRequest.displayName = username
                changeRequest.commitChanges { profileError in
                    self.hideActivityIndicator()
                    if let profileError = profileError {
                        print("Profile update error: \(profileError.localizedDescription)")
                        AppDelegate.appDelegate.showAlertFromAppDelegate(title: "Error", message: profileError.localizedDescription)
                    } else {
                        print("✅ User registered: \(user.email ?? "") with username: \(username)")
                        LBUtulites.isSaveUserLogin(isLogin: true, isConfirmUpdate: false)
                        let vc = UploadPhotoVC()
                        self.push(vc)
                    }
                }
            }
        }
    }
    
    // MARK: - setDefaultBorders
    private func setDefaultBorders() {
        [viewUsername, viewEmail, viewPassword, viewConfirmPassword, viewReferralCode].forEach {
            $0?.layer.borderWidth = 1
            $0?.layer.cornerRadius = 10
            $0?.layer.borderColor = UIColor.clear.cgColor
        }
    }
    
    // MARK: - Enable/Disable Continue Button
    @objc private func textFieldsDidChange() {
        updateContinueButtonState()
    }
    
    private func updateContinueButtonState() {
        let isUsernameFilled = !(txtUsername.text ?? "").isEmpty
        let isEmailFilled = !(txEmail.text ?? "").isEmpty
        let isPasswordFilled = !(txtPassword.text ?? "").isEmpty
        let isConfirmPasswordFilled = !(txtConfirmPassword.text ?? "").isEmpty
        
        // ✅ Referral code is NOT required
        if isUsernameFilled && isEmailFilled && isPasswordFilled && isConfirmPasswordFilled {
            viewContinueBtn.backgroundColor = UIColor.AppColor.appPrimeryColor
            lblConfirmBtn.textColor = .white
            viewContinueBtn.isUserInteractionEnabled = true
        } else {
            viewContinueBtn.backgroundColor = UIColor(hexString: "#F9F9F9")
            lblConfirmBtn.textColor = .darkGray
            viewContinueBtn.isUserInteractionEnabled = false
        }
    }
}

extension RegisterVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
        case txtUsername: viewUsername.layer.borderColor = UIColor.AppColor.appPrimeryColor.cgColor
        case txEmail: viewEmail.layer.borderColor = UIColor.AppColor.appPrimeryColor.cgColor
        case txtPassword: viewPassword.layer.borderColor = UIColor.AppColor.appPrimeryColor.cgColor
        case txtConfirmPassword: viewConfirmPassword.layer.borderColor = UIColor.AppColor.appPrimeryColor.cgColor
        case txtReferralCode: viewReferralCode.layer.borderColor = UIColor.AppColor.appPrimeryColor.cgColor
        default: break
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case txtUsername: viewUsername.layer.borderColor = UIColor.clear.cgColor
        case txEmail: viewEmail.layer.borderColor = UIColor.clear.cgColor
        case txtPassword: viewPassword.layer.borderColor = UIColor.clear.cgColor
        case txtConfirmPassword: viewConfirmPassword.layer.borderColor = UIColor.clear.cgColor
        case txtReferralCode: viewReferralCode.layer.borderColor = UIColor.clear.cgColor
        default: break
        }
    }
}
