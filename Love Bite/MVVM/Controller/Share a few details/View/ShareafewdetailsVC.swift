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
