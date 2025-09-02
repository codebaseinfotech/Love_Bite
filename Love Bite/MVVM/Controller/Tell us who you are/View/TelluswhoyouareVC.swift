//
//  TelluswhoyouareVC.swift
//  Love Bite
//
//  Created by iMac on 25/08/25.
//

import UIKit
import ADCountryPicker

class TelluswhoyouareVC: UIViewController {

    @IBOutlet weak var viewTopBar: UIView!
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var viewBottomBtn: UIView!
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var titleHeightConst: NSLayoutConstraint!
    @IBOutlet weak var titleTopConst: NSLayoutConstraint!
    
    @IBOutlet weak var lblCountry: UILabel!
    
    var isOpenProfile = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        // Do any additional setup after loading the view.
    }
    
    private func setupUI() {
        if isOpenProfile {
            // Case: Opened from Profile
            lblTitle.isHidden = true
            viewTopBar.isHidden = false
            viewBottomBtn.isHidden = true
            progressView.isHidden = true
            titleHeightConst.constant = 0
            titleTopConst.constant = 0
        } else {
            // Case: Normal Flow
            lblTitle.text = "Tell us who you are!"
            lblTitle.isHidden = false
            viewTopBar.isHidden = true
            viewBottomBtn.isHidden = false
        }
    }

    @IBAction func clickedGoBack(_ sender: Any) {
        self.goBack(animated: false)
    }
    
    @IBAction func clickedBack(_ sender: Any) {
        self.goBack(animated: false)
    }
    
    @IBAction func clickedNext(_ sender: Any) {
        let vc = WhenisthebigdayVC()
        self.push(vc, animated: false)
    }
    @IBAction func tappedCoutry(_ sender: Any) {
        let picker = ADCountryPicker()
        // delegate
        picker.delegate = self
        
        // Display calling codes
        picker.showCallingCodes = true
        
        // or closure
        picker.didSelectCountryClosure = { name, code in
            _ = picker.navigationController?.popToRootViewController(animated: true)
            print(code)
        }
        
        // Use this below code to present the picker
        
        let pickerNavigationController = UINavigationController(rootViewController: picker)
        self.present(pickerNavigationController, animated: true, completion: nil)
    }
}


extension TelluswhoyouareVC: ADCountryPickerDelegate {
    
    func countryPicker(_ picker: ADCountryPicker, didSelectCountryWithName name: String, code: String, dialCode: String)
    {
        _ = picker.navigationController?.popToRootViewController(animated: true)
        
        self.lblCountry.text = name
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func countryFlag(_ countryCode: String) -> String {
        let flagBase = UnicodeScalar("🇦").value - UnicodeScalar("A").value
        
        let flag = countryCode
            .uppercased()
            .unicodeScalars
            .compactMap({ UnicodeScalar(flagBase + $0.value)?.description })
            .joined()
        return flag
    }
    
    
}
