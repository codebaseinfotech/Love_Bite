//
//  EditProfileVC.swift
//  Love Bite
//
//  Created by iMac on 28/08/25.
//

import UIKit

class EditProfileVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func clickedBack(_ sender: Any) {
        self.goBack()
    }
    
    @IBAction func clickedPersonalInfo(_ sender: Any) {
        let vc = TelluswhoyouareVC()
        vc.isOpenProfile = true
        self.push(vc)
    }
    
    @IBAction func clickedBirthDateAndGender(_ sender: Any) {
        let vc = WhenisthebigdayVC()
        vc.isOpenProfile = true
        self.push(vc)
    }
    
    @IBAction func clickedPesonality(_ sender: Any) {
        let vc = ShareafewdetailsVC()
        vc.isOpenProfile = true
        self.push(vc)
    }
    
    @IBAction func clickedServiceFee(_ sender: Any) {
        let vc = DecideHowYouWillEarnVC()
        vc.isOpenProfile = true
        self.push(vc)
    }
    
    @IBAction func clickedGalleryPhotos(_ sender: Any) {
        let vc = ShowusyourbestshotsVC()
        vc.isOpenProfile = true
        self.push(vc)
    }
    
}
