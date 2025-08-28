//
//  DecideHowYouWillEarnVC.swift
//  Love Bite
//
//  Created by iMac on 28/08/25.
//

import UIKit
import DropDown

class DecideHowYouWillEarnVC: UIViewController {
    
    @IBOutlet weak var imgMale: UIImageView!
    @IBOutlet weak var imgFemale: UIImageView!
    @IBOutlet weak var imgEveryone: UIImageView!
    
    @IBOutlet weak var lblTokensPerMin: UILabel!
    @IBOutlet weak var lblTokensPerMessage: UILabel!
    
    @IBOutlet weak var viewMale: UIView!
    @IBOutlet weak var viewFemale: UIView!
    @IBOutlet weak var viewEveryone: UIView!
    
    
    let tokensPerMinuteDropDown = DropDown()
    let tokensPerMessageDropDown = DropDown()
    
    var selectedGender: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupDropDowns()
        // Do any additional setup after loading the view.
    }

    @IBAction func clickedBack(_ sender: Any) {
        self.goBack(animated: false)
    }
    
    @IBAction func clickedNext(_ sender: Any) {
        let vc = ShowusyourbestshotsVC()
        self.push(vc, animated: false)
    }
    
    @IBAction func clickedTokensPerMinute(_ sender: UIButton) {
        tokensPerMinuteDropDown.anchorView = sender
        tokensPerMinuteDropDown.show()
    }
    
    @IBAction func clickedTokenPerMessage(_ sender: UIButton) {
        tokensPerMessageDropDown.anchorView = sender
        tokensPerMessageDropDown.show()
    }
    
    @IBAction func clickedMaleBtn(_ sender: Any) {
        updateGenderSelection(gender: "Male")
    }
    
    @IBAction func clickedFemaleBtn(_ sender: Any) {
        updateGenderSelection(gender: "Female")
    }
    
    @IBAction func clickedEveryoneBtn(_ sender: Any) {
        updateGenderSelection(gender: "Everyone")
    }
    
    private func updateGenderSelection(gender: String) {
        selectedGender = gender
        
        // Reset all first
        imgMale.image = UIImage(named: "unselected")
        imgFemale.image = UIImage(named: "unselected")
        imgEveryone.image = UIImage(named: "unselected")
        
        viewMale.layer.borderColor = UIColor.clear.cgColor
        viewFemale.layer.borderColor = UIColor.clear.cgColor
        viewEveryone.layer.borderColor = UIColor.clear.cgColor
        
        // Set selected one
        switch gender {
        case "Male":
            imgMale.image = UIImage(named: "ic_Right")
            viewMale.layer.borderWidth = 1
            viewMale.layer.borderColor = UIColor.AppColor.appPrimeryColor.cgColor
        case "Female":
            imgFemale.image = UIImage(named: "ic_Right")
            viewFemale.layer.borderWidth = 1
            viewFemale.layer.borderColor = UIColor.AppColor.appPrimeryColor.cgColor
        case "Everyone":
            imgEveryone.image = UIImage(named: "ic_Right")
            viewEveryone.layer.borderWidth = 1
            viewEveryone.layer.borderColor = UIColor.AppColor.appPrimeryColor.cgColor
        default: break
        }
    }
    
    func setupDropDowns() {
        // Tokens Per Minute options
        tokensPerMinuteDropDown.dataSource = ["5 Tokens", "10 Tokens", "15 Tokens", "20 Tokens", "25 Tokens"]
        tokensPerMinuteDropDown.selectionAction = { [weak self] (index, item) in
            self?.lblTokensPerMin.text = item
        }
        
        // Tokens Per Message options
        tokensPerMessageDropDown.dataSource = ["1 Token", "2 Tokens", "3 Tokens", "5 Tokens", "10 Tokens"]
        tokensPerMessageDropDown.selectionAction = { [weak self] (index, item) in
            self?.lblTokensPerMessage.text = item
        }
        
        // Common dropdown customization
        [tokensPerMinuteDropDown, tokensPerMessageDropDown].forEach {
            $0.backgroundColor = .white
            $0.textColor = .black
//            $0.cornerRadius = 8.0
            $0.direction = .bottom
        }
    }
    
    
}
