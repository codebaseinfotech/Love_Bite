//
//  FilterVC.swift
//  Love Bite
//
//  Created by Ankit Gabani on 01/09/25.
//

import UIKit
import DropDown

class FilterVC: UIViewController {

    @IBOutlet weak var viewMan: UIView!
    @IBOutlet weak var viewWoman: UIView!
    @IBOutlet weak var viewOther: UIView!
    
    @IBOutlet weak var imgMan: UIImageView!
    @IBOutlet weak var imgWoman: UIImageView!
    @IBOutlet weak var imgOther: UIImageView!
    
    @IBOutlet weak var lblBodyType: UILabel!
    @IBOutlet weak var lblHeight: UILabel!
    @IBOutlet weak var lblEyeColor: UILabel!
    @IBOutlet weak var lblHairColor: UILabel!
    @IBOutlet weak var lblEthunicity: UILabel!
    @IBOutlet weak var lblCountry: UILabel!
    @IBOutlet weak var lbloccupation: UILabel!
    
    var selectedGender: String? = nil
    
    let bodyTypeDropDown = DropDown()
    let heightDropDown = DropDown()
    let eyeColorDropDown = DropDown()
    let hairColorDropDown = DropDown()
    let ethnicityDropDown = DropDown()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDropDowns()
        // Do any additional setup after loading the view.
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
            self?.lblEthunicity.text = item
        }
        
        // Common customization
        [bodyTypeDropDown, heightDropDown, eyeColorDropDown, hairColorDropDown, ethnicityDropDown].forEach {
            $0.backgroundColor = .white
            $0.textColor = .black
//            $0.cornerRadius = 8.0
            $0.direction = .bottom
        }
    }

    @IBAction func tappedBack(_ sender: Any) {
        self.goBack()
    }
    @IBAction func tappedClear(_ sender: Any) {
    }
    
    @IBAction func tappedMane(_ sender: Any) {
        updateGenderSelection(gender: "Men")
    }
    @IBAction func tappedWoman(_ sender: Any) {
        updateGenderSelection(gender: "Women")
    }
    @IBAction func tappedOther(_ sender: Any) {
        updateGenderSelection(gender: "Other")
    }
    
    @IBAction func tappedBodyTyoe(_ sender: UIButton) {
        bodyTypeDropDown.anchorView = sender
        bodyTypeDropDown.show()
    }
    @IBAction func tappedHeight(_ sender: UIButton) {
        heightDropDown.anchorView = sender
        heightDropDown.show()
    }
    @IBAction func tappedEyeColot(_ sender: UIButton) {
        eyeColorDropDown.anchorView = sender
        eyeColorDropDown.show()
    }
    @IBAction func tappedHairColor(_ sender: UIButton) {
        hairColorDropDown.anchorView = sender
        hairColorDropDown.show()
    }
    @IBAction func tappedEthnicity(_ sender: UIButton) {
        ethnicityDropDown.anchorView = sender
        ethnicityDropDown.show()
    }
    @IBAction func tappedCountry(_ sender: UIButton) {
    }
    @IBAction func tappedContentCreator(_ sender: UIButton) {
    }
    
    @IBAction func tappedApply(_ sender: Any) {
    }
    
    private func updateGenderSelection(gender: String) {
        selectedGender = gender
        
        // Reset all first
        imgMan.image = UIImage(named: "unselected")
        imgWoman.image = UIImage(named: "unselected")
        imgOther.image = UIImage(named: "unselected")
        
        viewMan.layer.borderColor = UIColor.clear.cgColor
        viewWoman.layer.borderColor = UIColor.clear.cgColor
        viewOther.layer.borderColor = UIColor.clear.cgColor
        
        // Set selected one
        switch gender {
        case "Men":
            imgMan.image = UIImage(named: "ic_Right")
            viewMan.layer.borderWidth = 1
            viewMan.layer.borderColor = UIColor.AppColor.appPrimeryColor.cgColor
        case "Women":
            imgWoman.image = UIImage(named: "ic_Right")
            viewWoman.layer.borderWidth = 1
            viewWoman.layer.borderColor = UIColor.AppColor.appPrimeryColor.cgColor
        case "Other":
            imgOther.image = UIImage(named: "ic_Right")
            viewOther.layer.borderWidth = 1
            viewOther.layer.borderColor = UIColor.AppColor.appPrimeryColor.cgColor
        default: break
        }
    }
}
