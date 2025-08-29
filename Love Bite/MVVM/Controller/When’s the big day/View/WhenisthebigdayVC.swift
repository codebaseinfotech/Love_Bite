//
//  WhenisthebigdayVC.swift
//  Love Bite
//
//  Created by iMac on 26/08/25.
//

import UIKit

class WhenisthebigdayVC: UIViewController {

    @IBOutlet weak var txtDob: UITextField!
    
    @IBOutlet weak var imgMenSelect: UIImageView!
    @IBOutlet weak var imgWomenSelect: UIImageView!
    @IBOutlet weak var imgOtherSelect: UIImageView!
    
    @IBOutlet weak var viewMen: UIView!
    @IBOutlet weak var viewWomen: UIView!
    @IBOutlet weak var viewOther: UIView!
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var viewTopBar: UIView!
    
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var viewBottomBtn: UIView!
    
    @IBOutlet weak var titleTopConst: NSLayoutConstraint!
    @IBOutlet weak var titleHeightConst: NSLayoutConstraint!
    
    
    var datePickerDOB = UIDatePicker()
    
    var selectedGender: String? = nil
    
    var isOpenProfile = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupDatePicker()
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
            lblTitle.text = "When’s the big day?"
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
        let vc = ShareafewdetailsVC()
        self.push(vc, animated: false)
    }
    

    @IBAction func btnDOBAction(_ sender: UITextField) {
        
    }
    
    @IBAction func clickedMenBtn(_ sender: Any) {
        updateGenderSelection(gender: "Men")
    }
    
    @IBAction func clickedWomenBtn(_ sender: Any) {
        updateGenderSelection(gender: "Women")
    }
    
    @IBAction func clickedOtherBtn(_ sender: Any) {
        updateGenderSelection(gender: "Other")
    }
    
    private func updateGenderSelection(gender: String) {
        selectedGender = gender
        
        // Reset all first
        imgMenSelect.image = UIImage(named: "unselected")
        imgWomenSelect.image = UIImage(named: "unselected")
        imgOtherSelect.image = UIImage(named: "unselected")
        
        viewMen.layer.borderColor = UIColor.clear.cgColor
        viewWomen.layer.borderColor = UIColor.clear.cgColor
        viewOther.layer.borderColor = UIColor.clear.cgColor
        
        // Set selected one
        switch gender {
        case "Men":
            imgMenSelect.image = UIImage(named: "ic_Right")
            viewMen.layer.borderWidth = 1
            viewMen.layer.borderColor = UIColor.AppColor.appPrimeryColor.cgColor
        case "Women":
            imgWomenSelect.image = UIImage(named: "ic_Right")
            viewWomen.layer.borderWidth = 1
            viewWomen.layer.borderColor = UIColor.AppColor.appPrimeryColor.cgColor
        case "Other":
            imgOtherSelect.image = UIImage(named: "ic_Right")
            viewOther.layer.borderWidth = 1
            viewOther.layer.borderColor = UIColor.AppColor.appPrimeryColor.cgColor
        default: break
        }
    }
    
    private func setupDatePicker() {
        // Configure date picker
        datePickerDOB.datePickerMode = .date
        if #available(iOS 13.4, *) {
            datePickerDOB.preferredDatePickerStyle = .wheels
        }
        datePickerDOB.maximumDate = Date()
        
        // Add toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "OK", style: .plain, target: self, action: #selector(donedatePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "CANCEL", style: .plain, target: self, action: #selector(cancelDatePicker))
        
        toolbar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        
        // Assign to textField
        txtDob.inputAccessoryView = toolbar
        txtDob.inputView = datePickerDOB
    }
    
    @objc func donedatePicker() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        txtDob.text = formatter.string(from: datePickerDOB.date)
        self.view.endEditing(true)
    }
    
    @objc func cancelDatePicker() {
        self.view.endEditing(true)
    }

}
