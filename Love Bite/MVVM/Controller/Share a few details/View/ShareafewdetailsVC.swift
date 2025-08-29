//
//  ShareafewdetailsVC.swift
//  Love Bite
//
//  Created by iMac on 27/08/25.
//

import UIKit
import DropDown

class ShareafewdetailsVC: UIViewController {
    
    @IBOutlet weak var lblBodyType: UILabel!
    @IBOutlet weak var lblHeight: UILabel!
    @IBOutlet weak var lblEyeColor: UILabel!
    @IBOutlet weak var lblHairColor: UILabel!
    @IBOutlet weak var lblEthnicity: UILabel!
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var viewTopBar: UIView!
    @IBOutlet weak var viewBottomBtn: UIView!
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblTopConst: NSLayoutConstraint!
    @IBOutlet weak var titleHeightConst: NSLayoutConstraint!
    
    let bodyTypeDropDown = DropDown()
    let heightDropDown = DropDown()
    let eyeColorDropDown = DropDown()
    let hairColorDropDown = DropDown()
    let ethnicityDropDown = DropDown()
    
    var isOpenProfile = false

    override func viewDidLoad() {
        super.viewDidLoad()

        setupDropDowns()
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
            lblTopConst.constant = 0
        } else {
            // Case: Normal Flow
            lblTitle.text = "Share a few details"
            lblTitle.isHidden = false
            viewTopBar.isHidden = true
            viewBottomBtn.isHidden = false
        }
    }
    
    func setupDropDowns() {
        // Body Type
        bodyTypeDropDown.dataSource = ["Slim", "Athletic", "Average", "Heavy"]
        bodyTypeDropDown.selectionAction = { [weak self] (index, item) in
            self?.lblBodyType.text = item
        }
        
        // Height
        heightDropDown.dataSource = ["< 5ft", "5ft - 5'5", "5'6 - 6ft", "6ft+"]
        heightDropDown.selectionAction = { [weak self] (index, item) in
            self?.lblHeight.text = item
        }
        
        // Eye Color
        eyeColorDropDown.dataSource = ["Black", "Brown", "Blue", "Green", "Hazel", "Grey"]
        eyeColorDropDown.selectionAction = { [weak self] (index, item) in
            self?.lblEyeColor.text = item
        }
        
        // Hair Color
        hairColorDropDown.dataSource = ["Black", "Brown", "Blonde", "Red", "Grey", "Other"]
        hairColorDropDown.selectionAction = { [weak self] (index, item) in
            self?.lblHairColor.text = item
        }
        
        // Ethnicity
        ethnicityDropDown.dataSource = ["Asian", "African", "Caucasian", "Hispanic", "Middle Eastern", "Other"]
        ethnicityDropDown.selectionAction = { [weak self] (index, item) in
            self?.lblEthnicity.text = item
        }
        
        // Common customization
        [bodyTypeDropDown, heightDropDown, eyeColorDropDown, hairColorDropDown, ethnicityDropDown].forEach {
            $0.backgroundColor = .white
            $0.textColor = .black
//            $0.cornerRadius = 8.0
            $0.direction = .bottom
        }
    }
    
    @IBAction func clickedGoBack(_ sender: Any) {
        self.goBack(animated: false)
    }
    

    @IBAction func clickedBack(_ sender: Any) {
        self.goBack(animated: false)
    }
    
    @IBAction func clickedNext(_ sender: Any) {
        let vc = DecideHowYouWillEarnVC()
        self.push(vc, animated: false)
    }
    
    @IBAction func clickedBodyType(_ sender: UIButton) {
        bodyTypeDropDown.anchorView = sender
        bodyTypeDropDown.show()
    }
    
    @IBAction func clickedHeight(_ sender: UIButton) {
        heightDropDown.anchorView = sender
        heightDropDown.show()
    }
    
    @IBAction func clickedEyeColor(_ sender: UIButton) {
        eyeColorDropDown.anchorView = sender
        eyeColorDropDown.show()
    }
    
    @IBAction func clickedHairColor(_ sender: UIButton) {
        hairColorDropDown.anchorView = sender
        hairColorDropDown.show()
    }
    
    @IBAction func clickedEthnicity(_ sender: UIButton) {
        ethnicityDropDown.anchorView = sender
        ethnicityDropDown.show()
    }
    
    
}
