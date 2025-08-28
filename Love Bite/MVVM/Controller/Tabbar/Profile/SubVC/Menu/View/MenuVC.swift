//
//  MenuVC.swift
//  Love Bite
//
//  Created by Ankit Gabani on 28/08/25.
//

import UIKit

class MenuVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func tappedBack(_ sender: Any) {
        self.goBack()
    }
    
    @IBAction func tappedLoveUser(_ sender: Any) {
        let vc = LoveUserVC()
        self.push(vc)
    }
    @IBAction func tappedGroupMembers(_ sender: Any) {
    }
    @IBAction func tappedBlockedUser(_ sender: Any) {
        let vc = BlockUserVC()
        self.push(vc)
    }
    @IBAction func tappedReferAFriend(_ sender: Any) {
    }
    @IBAction func tappedChangePassword(_ sender: Any) {
    }
    @IBAction func tappedNotification(_ sender: Any) {
    }
    @IBAction func tappedDeleteAccount(_ sender: Any) {
    }
    @IBAction func tappedTermsCondition(_ sender: Any) {
    }
    @IBAction func tappedPrivacyPolicy(_ sender: Any) {
    }
    
    @IBAction func tappedLogout(_ sender: Any) {
    }
    
}
