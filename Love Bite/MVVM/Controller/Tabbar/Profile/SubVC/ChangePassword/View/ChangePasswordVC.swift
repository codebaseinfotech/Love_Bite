//
//  ChangePasswordVC.swift
//  Love Bite
//
//  Created by Ankit Gabani on 29/08/25.
//

import UIKit

class ChangePasswordVC: UIViewController {

    @IBOutlet weak var txtCPassword: UITextField!
    @IBOutlet weak var txtNPassword: UITextField!
    @IBOutlet weak var txtCofirmPassword: UITextField!
    
    @IBOutlet weak var imgCPassword: UIImageView!
    @IBOutlet weak var imgNPassword: UIImageView!
    @IBOutlet weak var imCNPassword: UIImageView!
    
    var isCurrentPassword = false
    var isNewPassword = false
    var isCNewPassword = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func tappedBack(_ sender: Any) {
        self.goBack()
    }
    @IBAction func tappedUpdate(_ sender: Any) {
    }
    
    @IBAction func tappedShowCPassword(_ sender: Any) {
        isCurrentPassword.toggle()
        
        imgCPassword.image = isCurrentPassword ? UIImage(named: "hide") : UIImage(named: "ic_eye")
        txtCPassword.isSecureTextEntry = isCurrentPassword ? false : true
    }
    @IBAction func tappedNPassowrd(_ sender: Any) {
        isNewPassword.toggle()
        
        imgNPassword.image = isNewPassword ? UIImage(named: "hide") : UIImage(named: "ic_eye")
        txtNPassword.isSecureTextEntry = isNewPassword ? false : true
    }
    @IBAction func tappedCNPassword(_ sender: Any) {
        isCNewPassword.toggle()
        
        imCNPassword.image = isCNewPassword ? UIImage(named: "hide") : UIImage(named: "ic_eye")
        txtCofirmPassword.isSecureTextEntry = isCNewPassword ? false : true
    }
    

}
